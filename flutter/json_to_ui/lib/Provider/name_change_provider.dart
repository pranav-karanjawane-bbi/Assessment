import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class NameChangeProvider with ChangeNotifier{
  // String? newName = '';
void changeName(String updateNameController){
  prefs!.setString('signUpName',updateNameController.toString() );

  notifyListeners();
}
}