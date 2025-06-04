import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Center(
        child: Container(
          color: Colors.red,
          height: MediaQuery.sizeOf(context).height * 1,
          child: Text("data"),
        ),
      ),
    );
  }
}
