

import 'package:json_ui_clean_architecture/features/home_data/data/datasources/home_data_local_data_source.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/datasources/home_data_remote_data_source.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/models/home_data_model.dart';
import 'package:json_ui_clean_architecture/features/home_data/domain/entities/home_data.dart' as model;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../features/home_data/domain/entities/home_data.dart';

List<HomeDataModel> objList =[];

late Future <model.HomeData> receivedData;
bool? isSwitched = false; //true is for api
String? storedOnlineData;
String? storedAssetData;
SharedPreferences? prefs ;
String? dataInfo;

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

final TextEditingController loginEmailController = TextEditingController();
final TextEditingController loginPasswordController = TextEditingController();

int flag = 1;
bool? decision;
bool valuefirst = false;

String getName() {
  // final String? signUpName = prefs!.getString('signUpName');
  String signUpName = 'Json to UI';
  return signUpName!;
}