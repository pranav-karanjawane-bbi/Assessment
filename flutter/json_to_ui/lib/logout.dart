import 'package:flutter/material.dart';
import 'main.dart';


class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  String? gotName;
   getName(){
    final String? signUpName = prefs!.getString('signUpName');
    gotName = signUpName;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "$gotName",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade200,),
                  onPressed: (){
                     prefs!.remove('checkbox');
                     Navigator.of(context).pushNamedAndRemoveUntil('login', (Route route) => false);

                    // Navigator.pushReplacementNamed(context, 'login');
                    // Navigator.pop(context,'home');
                  },
                  child: const Text('Logout',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),)
              ),
            )
          ],
        ),
    );
  }
}

