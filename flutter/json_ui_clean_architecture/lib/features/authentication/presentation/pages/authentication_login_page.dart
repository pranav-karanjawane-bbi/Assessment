import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:json_ui_clean_architecture/features/home_data/presentation/bloc/home_data_bloc.dart';

import '../../../../core/util/utility.dart';
import '../../../../injection_container.dart';
import '../../data/datasource/authentication_data_source.dart';
import '../../domain/usecases/aunthentication_login_usecase.dart';
import '../bloc/authentication_data_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  late AuthenticationLoginUsecase loginUsecase;
  late AuthenticationDataSource dataSource;
  // int flag = 1;
  //
  // bool? decision;
  // final TextEditingController nameController = TextEditingController();
  // late TextEditingController emailController = TextEditingController();
  // late TextEditingController passwordController = TextEditingController();
  // bool valuefirst = false;



  //
  //
  //
  // Future<dynamic> getUserData() async {
  //   final String userDetails =
  //   await http.read(Uri.parse(
  //       "https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/user_details.json"));
  //   final dynamic? userData = jsonDecode(userDetails);
  //   // print(userData);
  //   return userData;
  // }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                child: Text("Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan.shade400,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation : 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(width: 3, color: Colors.cyanAccent),
                  ),
                  child:  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your Email',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your Password',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.blue,
                    value: valuefirst,
                    onChanged: (bool? value) {
                      Future<void>ticked()async{

                        await prefs!.setBool('checkbox', valuefirst);
                      }
                      setState((){
                        valuefirst = value!;
                        ticked();
                      });
                    },
                  ),
                  const Text('Remember Me',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                      ),
                      onPressed: ()async {
                         // var myEmail = emailController.text ;
                         // var myPassword = passwordController.text;
                         //
                         // emailController = myEmail;
                         // passwordController = myPassword;
                          await sl<AuthenticationDataBloc>().callAuthenticationForLogin();
                        // await loginUsecase.authenticationDataRepository.getAuthenticationLogin();
                        if(decision == true) {
                          // Navigator.pushReplacementNamed(context, 'home');
                          BlocProvider.of<HomeDataBloc>(context).loadHomeFeatureScreen();
                        }
                        else{
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("It Seems You are not signed in"),
                              content: const Text("Please sign in"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    color: Colors.green,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("okay",
                                      style: TextStyle(color: Colors.black54),),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        flag = 0;
                      },
                      child: const Text('Submit',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),),
                    ),//login button
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade300,
                ),
                onPressed: (){

                  // Navigator.pushReplacementNamed(context, 'signup');

                  BlocProvider.of<AuthenticationDataBloc>(context).loadLoginToSignupScreen();
                },
                child: const Text('SignUp!',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),),
              ), //signup button
            ],
          ),
        ),
      ),
    );
  }
}

