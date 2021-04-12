import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? buildPortrait(screensize)
              : buildLandscape(screensize),
        ),
      ),
    );
  }

  Column buildPortrait(Size screensize) {
    return Column(
      children: [
        Image(
            image: AssetImage('images/12.jpg'),
            height: screensize.height / 3,
            width: screensize.width,
            fit: BoxFit.fill),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Oeschinen Lake Campground",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Kandersteg, Switzerland",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text("41"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: screensize.height / 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildColumn(
                  color: Colors.blueAccent, icon: Icons.phone, txt: 'Call'),
              buildColumn(
                  color: Colors.blueAccent, icon: Icons.near_me, txt: 'ROUTE'),
              buildColumn(
                  color: Colors.blueAccent, icon: Icons.share, txt: 'SHARE'),
            ],
          ),
        ),
        textSection,
      ],
    );
  }

  Row buildLandscape(Size screensize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screensize.width / 2,
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Oeschinen Lake Campground",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Kandersteg, Switzerland",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        Text("41"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screensize.height / 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildColumn(
                        color: Colors.blueAccent,
                        icon: Icons.phone,
                        txt: 'Call'),
                    buildColumn(
                        color: Colors.blueAccent,
                        icon: Icons.near_me,
                        txt: 'ROUTE'),
                    buildColumn(
                        color: Colors.blueAccent,
                        icon: Icons.share,
                        txt: 'SHARE'),
                  ],
                ),
              ),
              textSection,
            ],
          ),
        ),
        Column(
          children: [
            Image(
              image: AssetImage('images/12.jpg'),
              height: screensize.height,
              width: screensize.width / 2,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ],
    );
  }

  Column buildColumn({String txt, IconData icon, Color color}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blueAccent,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          txt,
          style: TextStyle(fontSize: 20, color: color),
        ),
      ],
    );
  }

  Widget textSection = Container(
    padding: const EdgeInsets.all(20),
    child: Text(
      'Lake OeschinenLake Oeschinen lies at the foot of the Blüemlisalp. Situated 1,578 meter above sea level, it is one of the larger Alpine Lakes. A gondola train leads from Kandersteg to a location near the lake. A half-hour walk across pastures and through pine forest takes you to the lake. The water in the lake warms up to 20 degree Celsius in the summer. Activities enjoyed here include rowing or riding on the summer toboggan run.The rich mountain flora with orchids, gentian and edelweiss, the herds of sheep and cows grazing on the Alps and the wild animals on the mountain slopes attract nature lovers to the lake at the entrance to the Unesco World Heritage Site. In the winter, ice fishing or the 3.5 kilometer long toboggan run from the lake to the gondola station are popular attractions.',
      softWrap: true,
    ),
  );
}
