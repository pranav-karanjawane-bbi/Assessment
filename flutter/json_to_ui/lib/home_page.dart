import 'dart:convert';
import 'package:flutter/material.dart';
import 'guideline_model.dart' as model;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'main.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  late Future <model.GuidelineModel> receivedData;
  bool? isSwitched = true; //true is for api
  String? storedOnlineData;
  String? storedAssetData;
  List<model.GuidelineModel> objList =[];
  String? dataInfo;

  Future<List<model.GuidelineModel>> fetchData() async {
    storedOnlineData =
    await http.read(Uri.parse('https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/home_screen.json'));
    final data2 =  jsonDecode(storedOnlineData!);
    int lenData = data2.length;
    objList.clear();
    for (int i = 0; i < lenData; i++) {
      objList.add(model.GuidelineModel.fromJson(data2[i]));
    }
    return (objList);
  }

  Future<List<model.GuidelineModel>> fetchAssetData() async {
    storedAssetData =
          await rootBundle.loadString('assets/temp.json');
    final data =  jsonDecode(storedAssetData!);
    int lenData = data.length;
    objList.clear();
    for (int i = 0; i < lenData; i++) {
      objList.add(model.GuidelineModel.fromJson(data[i]));
    }
    return (objList);
  }


  //fetching content from the json file

  Future<List<model.GuidelineModel>> readJson() async {
    if (isSwitched! == true) {
      if (storedAssetData == null) {
        await fetchAssetData();
      }
      else
      {
        objList.clear();
      final data = await json.decode(storedAssetData!);
      int lenData = data.length;
      for (int i = 0; i < lenData; i++) {
        objList.add(model.GuidelineModel.fromJson(data[i]));
      }

      objList.sort((a, b) {
        return int.parse(a.sequenceNo!).compareTo(int.parse(b.sequenceNo!));
      });
        // return (objList);
    }

    }
    // return (objList);
  if(isSwitched! == false) {

    if (storedOnlineData == null) {
      await fetchData();
    }
    else {
      objList.clear();
      final data2 = jsonDecode(storedOnlineData!);
      int lenData = data2.length;
      for (int i = 0; i < lenData; i++) {
        objList.add(model.GuidelineModel.fromJson(data2[i]));
      }

    }//else

  }//switch
    return(objList);
  }// readjson

  Color colorConverter(String convColor) {
    return Color(int.parse(convColor!.replaceAll("#", "0XFF")));
  }

  String display(){
    if(isSwitched! == true) {
      dataInfo = "This is Asset data";
    } else {
      dataInfo = "This is online API data";
    }
    return (dataInfo!);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Json to UI",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
          actions: [
            Center(child: Text(display(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                ))),
            Switch(
              value: isSwitched!,
              onChanged: (value){
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
              inactiveTrackColor: Colors.purpleAccent,

            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,'logout');
                },
                child: const Icon(
                  Icons.menu,
                ),
              ),
            )
          ],
        ),
        // body: FutureBuilder<List<model.GuidelineModel>>(
      body: FutureBuilder<dynamic>(

          future: readJson(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
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
