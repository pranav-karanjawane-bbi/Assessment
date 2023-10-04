import 'dart:convert';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int flag = 1;

  bool? decision;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool valuefirst = false;




  Future<void> validate (String inputEmail,String inputPassword)  async {
  var userData = await getUserData();
  int? emailResult;
  int? passwordResult;
  int? emailResultOnline;
  int? passwordResultOnline;

  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? signUpEmail = prefs!.getString('signUpEmail');
  final String? signUpPassword = prefs!.getString('signUpPassword');
  String onlineEmail = userData['email'];
  String onlinePassword = userData['password'];

    emailResult = inputEmail.compareTo(signUpEmail!);
    passwordResult = inputPassword.compareTo(signUpPassword!);
    emailResultOnline = inputEmail.compareTo(onlineEmail);
    passwordResultOnline = inputPassword.compareTo(onlinePassword);

  if (inputEmail.isEmpty) {
    decision = false;
  } else {
    if ((emailResult == 0 && passwordResult == 0)||(emailResultOnline == 0 && passwordResultOnline == 0)) {
      decision = true;
    }

    else {
      decision = false;
    }
  }
}



  Future<dynamic> getUserData() async {
    final String userDetails =
    await http.read(Uri.parse(
        "https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/user_details.json"));
    final dynamic? userData = jsonDecode(userDetails);
    // print(userData);
    return userData;
  }


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

                        await validate(emailController.text, passwordController.text);
                        if(decision == true) {
                          Navigator.pushReplacementNamed(context, 'home');
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

                    Navigator.pushReplacementNamed(context, 'signup');

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

