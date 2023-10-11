import 'package:equatable/equatable.dart';

class AuthenticationData extends Equatable{
  const AuthenticationData({
    this.email,
    this.password,
    this.name
  });
   final String? email;
   final String? password;
   final String? name;



  @override
  // TODO: implement props
  List<Object?> get props => [name,email,password];

}