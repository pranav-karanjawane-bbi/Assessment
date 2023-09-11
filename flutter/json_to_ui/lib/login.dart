import 'main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool? decision;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool valuefirst = false;

  // Future<void> predefined()async{
  //   final SharedPreferences prefs = await  SharedPreferences.getInstance();
  //
  // }


  Future<void> validate (String inputEmail,String inputPassword)  async {
    int? emailResult;
    int? passwordResult;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? signUpEmail = prefs!.getString('signUpEmail');
    final String? signUpPassword = prefs!.getString('signUpPassword');
    if(signUpEmail == null && signUpPassword == null){
      decision = false;}
      else{
    emailResult = inputEmail.compareTo(signUpEmail!);
    passwordResult = inputPassword.compareTo(signUpPassword!);}
    if (inputEmail.isEmpty) {
      decision = false;
    } else {
      if (emailResult == 0 && passwordResult == 0) {
        decision = true;
      }
      else {
        decision = false;
      }
    }
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
                      onPressed: (){

                        validate(emailController.text, passwordController.text);
                        if(decision!) {
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

                    Navigator.pushNamed(context, 'signup');

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

