import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Screen 2",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.red
          ),),
      ),
    );
  }
}
