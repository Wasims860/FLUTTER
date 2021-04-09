import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Wasim Shehadeh'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [
          FlatButton(
              child: Text(
            'Code',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ))
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blueAccent.shade400,
                height: screenSize.height / 3,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.phone,
                        size: 30,
                      ),
                      radius: 30,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/profile.jpg'),
                        radius: 70,
                      ),
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.message,
                        size: 30,
                      ),
                      radius: 30,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 220),
                  Center(
                    child: Text(
                      'Wasim Shehadeh',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Flutter Programmer',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildContainer(
                  screenSize, '2000', 'FOLLOWERS', Colors.blueAccent),
              buildContainer(screenSize, '200', 'FOLLOWING', Colors.blue),
            ],
          ),
          buildCard('Email', 'waseems860@gmail.com'),
          buildCard('Phone', '+963999649128'),
          buildCard('Twitter', 'https://twitter.com/waseems860'),
          buildCard('Facebook', 'facebook.com/waseem.shehada/'),
        ],
      ),
    );
  }

  Container buildContainer(
      Size screenSize, String num, String follow, Color color) {
    return Container(
      height: screenSize.height / 12,
      width: screenSize.width / 2,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              num,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              follow,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(String title, String subtitle) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
