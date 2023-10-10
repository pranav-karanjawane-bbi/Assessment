import "package:flutter/material.dart";
import 'package:json_ui_clean_architecture/core/util/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NameChangeProvider with ChangeNotifier{
  // String? newName = '';
  void changeName(String updateNameController){
    prefs!.setString('signUpName',updateNameController.toString() );

    notifyListeners();
  }
}