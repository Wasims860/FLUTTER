import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'اتصل بنا'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.cairo(),
        ),
        centerTitle: true,
        actions: [Icon(Icons.arrow_forward_outlined)],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'لمزيد من  المعلومات لا تتردد بالتواصل معنا في أي وقت',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                buildColumn(
                    lbl: 'الهاتف',
                    icon: FontAwesomeIcons.phone,
                    subTitle: '011-2111919'),
                buildColumn(
                    lbl: 'الموبايل',
                    icon: Icons.phone_android,
                    subTitle: '0941172277'),
                buildColumn(
                    lbl: 'فيسبوك',
                    icon: FontAwesomeIcons.facebookSquare,
                    subTitle: 'سماعة حكيم'),
                buildColumn(
                    lbl: 'البريد الإلكتروني',
                    icon: Icons.email,
                    subTitle: 'info@appstand.net'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildColumn({String lbl, IconData icon, String subTitle}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lbl,
              style: GoogleFonts.cairo(fontSize: 22),
            ),
            Text(
              '   ',
            ),
            Icon(
              icon,
              textDirection: TextDirection.ltr,
              color: Colors.blueAccent,
              size: 30,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subTitle,
            style: GoogleFonts.cairo(
                fontSize: 22,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
