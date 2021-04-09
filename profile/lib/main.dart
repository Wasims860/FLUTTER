import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User Profile",
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String _fullName = "Waseem Shehadeh";
  final String _bio = "Telecomunication Engineer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(),
          Column(
            children: <Widget>[
              SizedBox(height: 110),
              _buildProfileImage(),
              SizedBox(
                height: 20,
              ),
              _buildText(_fullName),
              SizedBox(
                height: 20,
              ),
              _buildText(_bio),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCoverImage() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/cover.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
        child: CircleAvatar(
      radius: 100,
      backgroundColor: Colors.black,
      backgroundImage: AssetImage('images/profile.jpg'),
    ));
  }

  Widget _buildText(String lbl) {
    return Center(
      child: Text(
        lbl,
        style: TextStyle(
          color: Colors.black,
          fontSize: 33.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
