
import 'package:json_ui_clean_architecture/features/authentication/domain/entities/authentication_data.dart';

class AuthenticationModel extends AuthenticationData{

   const AuthenticationModel({
      String? email,
      String? password,
      String? name,
  }):super(email: email, password: password, name: name);

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
     email : json['email'],
     password : json['password'],
     name : json['name'],
    );

  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data =  <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    return data;
  }
}