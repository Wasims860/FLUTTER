import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I am Rich',
      debugShowCheckedModeBanner: false,
      home: Rich(),
    );
  }
}

class Rich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('I AM RICH'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Image.asset('images/1.png'),
        ),
      ),
    );
  }
}
