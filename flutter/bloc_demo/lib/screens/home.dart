import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Screen 1",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.red
          ),),
      ),
    );
  }
}
