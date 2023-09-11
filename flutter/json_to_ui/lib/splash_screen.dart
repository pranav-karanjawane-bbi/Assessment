import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds:3),()async {

      final bool? checkedvalue = prefs!.getBool('checkbox');
      // var ans = check();

      if(checkedvalue == true){
        Navigator.pushReplacementNamed(context,'home');
      }
      else {
        Navigator.pushReplacementNamed(
            context,'login');
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: const Center(
          child:  Text("PK",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
            ,),
        ),
      ),
    );
  }
}
