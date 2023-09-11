import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';
import 'home_page.dart';
import 'logout.dart';


SharedPreferences? prefs ;
void main() async{
  runApp(const MyApp());
  prefs = await SharedPreferences.getInstance();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: 'splash',
        routes: {
          'splash': (context) => const SplashScreen(),
          'signup': (context) => const SignUp(),
          'login': (context) => const LoginPage(),
          'logout': (context) => const Logout(),
          'home': (context) => const HomePage(),
        }
    );
  }
}


