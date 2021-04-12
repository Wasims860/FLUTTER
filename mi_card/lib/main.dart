import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpg'),
                radius: 60,
              ),
              Text(
                'Wasim Shehadeh',
                style: GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
              ),
              Text(
                'Flutter Developer',
                style: GoogleFonts.sansita(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                //width: screenSize.width / 2,
                child: Divider(
                  height: 30,
                  color: Colors.teal.shade100,
                  endIndent: screenSize.width / 8,
                  indent: screenSize.width / 8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: ListTile(
                    title: Text('waseems860@gmail.com',
                        style: GoogleFonts.sansita(fontSize: 20)),
                    leading: Icon(
                      Icons.mail,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: ListTile(
                    title: Text('+999649128',
                        style: GoogleFonts.sansita(fontSize: 20)),
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
