import 'dart:convert';
import 'package:tuple/tuple.dart';
import 'package:dartz/dartz.dart';
import 'package:json_ui_clean_architecture/features/authentication/data/model/authentication_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:json_ui_clean_architecture/features/authentication/domain/entities/authentication_data.dart';
import '../../../../core/error/faiure.dart';
import '../../../../core/util/utility.dart';

abstract class AuthenticationDataSource{
  Future getUserDataApi();
  setUserDataLocal();

}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {

  Future getUserDataApi() async{
    final String userDetails =
    await http.read(Uri.parse(
        "https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/user_details.json"));
    final dynamic? userData = jsonDecode(userDetails);
    // print(userData);
    return (userData);
      //   on ServerFailure{
      // return left(ServerFailure());
      //   }

  }

  @override
  setUserDataLocal() {

      prefs!.setString('signUpEmail', emailController.text);
      prefs!.setString('signUpPassword', passwordController.text);
      prefs!.setString('signUpName', nameController.text);
  }


}

