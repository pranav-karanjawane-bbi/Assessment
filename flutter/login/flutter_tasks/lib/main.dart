import 'package:flutter/material.dart';
import 'package:flutter_tasks/second_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  @override
  void initState(){
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage('assets/images/loginImage.jpeg'),
                fit: BoxFit.fill),
                color: Colors.black,
                boxShadow: const [
                  BoxShadow(blurRadius: 30.0)
                ],
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 90.0)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
             SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  shape:  const RoundedRectangleBorder(
                      side: BorderSide(width: 1,color: Colors.black54,
                      )
                  ),
                  elevation: 30,

                  child: Column(

                    children: [
                      const ListTile(
                        title: Center(
                          child: Text("Login",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ),
                      const ListTile(
                        title: Text("Username"),
                        subtitle: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Username"
                          ),
                        ),
                      ),
                      // Divider(thickness: 2,),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0,top: 8.0),
                        child: ListTile(
                          title: const Text("Password"),
                          subtitle: TextField(
                            obscureText:  passwordVisible,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: "Enter Password",
                                suffixIcon: IconButton(
                                    icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
                                  onPressed: (){
                                      setState(
                                          (){
                                            passwordVisible = !passwordVisible;
                                          },
                                      );
                                  },
                                ),

                            ),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.green,
              ),
                onPressed: (){
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => const SecondPage())
                  // );

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SecondPage()));
                }, child: const Text("Submit",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )),
            // GestureDetector(
            //   onTap: (){
            //     Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => const SecondPage())
            //     );
            //   },
            //   child: Container(
            //     height: 80,
            //     width: 120,
            //     color: Colors.red,
            //     child: const Text(
            //       "Submit",
            //       style: TextStyle(
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // )

          ],

        ),
      ),

    );
  }
}
