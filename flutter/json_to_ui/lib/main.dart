import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'guideline_model.dart' as model;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<model.GuidelineModel> objList = [];

class _HomePageState extends State<HomePage> {
  //fetching content from the json file
  Future<List<model.GuidelineModel>> readJson() async {
    await Future.delayed(Duration(seconds:3));
    final String response = await rootBundle.loadString('assets/temp.json');
    final data = await json.decode(response);
    int lenData = data.length;
    print("my output $lenData");

    List<model.GuidelineModel> objList =[];
    for (int i = 0; i < lenData; i++) {
      objList.add(model.GuidelineModel.fromJson(data[i]));
    }

    objList.sort((a, b) {
      return int.parse(a.sequenceNo!).compareTo(int.parse(b.sequenceNo!));
    });
    return(objList);
  }

  Color colorConverter(String convColor) {
    return Color(int.parse(convColor!.replaceAll("#", "0XFF")));
  }


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   readJson();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json to UI"),
      ),
      body: FutureBuilder<List<model.GuidelineModel>>(
        future: readJson(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          else {
            List<model.GuidelineModel>objList = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    // this is the main listview builder the vertical axis direcrtion
                    itemCount: objList.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Container(
                          height: 270,
                          // width: 550,
                          color: Colors.grey.shade300,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  // this is the nested listvew bulder for the specific cards
                                  scrollDirection: Axis.horizontal,
                                  itemCount: objList[index].items!.length,
                                  itemBuilder: (context, num) {

                                    model.Items it = objList[index].items![num];

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 10,
                                            color: colorConverter(it.defaultProperties!.color!.themeColor!),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 3, color: Colors.amber),
                                              color: colorConverter(it.defaultProperties!.color!.backgroundColor!),
                                            ),

                                            child: Text(
                                              "${objList[index].items![num].id}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              //**************************
                              Visibility(
                                visible: objList[index]!.showOnlySubCategory!,
                                child: Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: objList[index].subCategory!.items1?.length,
                                    itemBuilder: (context, number){

                                      model.Items1 item = objList[index].subCategory!.items1![number];

                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 10,
                                              color: colorConverter(item.defaultProperties!.color!.themeColor!),

                                            ),
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 3, color: Colors.deepPurple),
                                                color: colorConverter(item.defaultProperties!.color!.backgroundColor!),
                                              ),

                                              child: Text(
                                                "${objList[index].subCategory!.items1![number].id}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ) // ***************************************


                            ],
                          ),
                        ),
                      );


                      // Text("data ${objList[index].categoryName}");
                    },
                  ),
                ),
              ],
            );
          }
        },
      )



    );
  }
}
