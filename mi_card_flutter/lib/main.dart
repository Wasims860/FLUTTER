import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.green,
      home: Scaffold(
        body: Container(
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpg'),
                radius: 70,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Wasim Shehadeh',
                      style: GoogleFonts.pacifico(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'FLUTTER DEVELOPER',
                      style: GoogleFonts.sansita(
                          color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                      width: 150,
                      child: Divider(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                      child: ListTile(
                        leading: Icon(Icons.email),
                        title: Text(
                          'waseems860@gmail.com',
                          style: GoogleFonts.sansita(
                              color: Colors.teal, fontSize: 15),
                        ),
                      ),
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                      child: ListTile(
                        leading: Icon(Icons.phone),
                        title: Text(
                          '+983999649128',
                          style: GoogleFonts.sansita(
                              color: Colors.teal, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
