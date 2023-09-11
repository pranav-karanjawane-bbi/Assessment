import 'main.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


   predefined(){
    // final SharedPreferences prefs = await  SharedPreferences.getInstance();
     prefs!.setString('signUpEmail', emailController.text);
    prefs!.setString('signUpPassword', passwordController.text);
    prefs!.setString('signUpName', nameController.text);


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
                child: Text("SignIn",
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
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your Name',
                            ),
                          ),
                        ),
                      ),
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

                  Padding(
                    padding: const EdgeInsets.only(left: 120.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade200,
                      ),
                      onPressed: ()async {
                        predefined();
                          if(emailController.text.isEmpty || passwordController.text.isEmpty || nameController.text.isEmpty){
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("It Seems You have left the fields empty"),
                                content: const Text("Please fill all the fields"),
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
                          else {
                            Navigator.pushReplacementNamed(
                                context, 'login');
                          }

                      },
                      child: const Text('Submit',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

