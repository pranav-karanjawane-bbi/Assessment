import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'Provider/name_change_provider.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/models/home_data_model.dart' as model;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:json_ui_clean_architecture/main.dart';

import '../../../../core/util/name_change_provider.dart';
import '../../../../core/util/utility.dart';
import '../../../../injection_container.dart';
import '../../data/models/home_data_model.dart';
import '../../data/repositories/home_data_repository_impl.dart';
import '../../domain/entities/home_data.dart';
import '../bloc/home_data_bloc.dart';
import '../widgets/color_converter.dart';
import '../widgets/display_guideline.dart';

// import 'login.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  // late Future <model.HomeDataModel> receivedData;
  // bool? isSwitched = true; //true is for api
  // String? storedOnlineData;
  // String? storedAssetData;
  // List<model.HomeDataModel> objList =[];
  // String? dataInfo;
  //
  // _HomePageState({required this.homeBloc});
  // late HomeDataBloc homeBloc;

  String display(){
    if(isSwitched! == false) {
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
          title: Consumer<NameChangeProvider>(builder: (context, provider, child) {
            return  Text(getName(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),);
          },
          ),
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

        body: FutureBuilder<List<model.HomeDataModel>>(
    // body: FutureBuilder<dynamic>(

          future: sl<HomeDataBloc>().callDecider(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            else {
              List<model.HomeDataModel>objList = snapshot.data!;
              return displayGuideline();
            }
          },
        )



    );
  }
}
