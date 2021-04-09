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
        primarySwatch: Colors.grey,
        backgroundColor: Colors.white,
      ),
      home: MyHomePage(title: 'Messages'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text(
                'SEARCH',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                'MORE',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              )),
        ],
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          buildCard(
              title: 'Syriatel',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '12 Jan'),
          buildCard(
              title: 'MTN',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '13 Jan'),
          buildCard(
              title: 'Abili',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '14 Jan'),
          buildCard(
              title: 'IShow',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '29 Jan'),
          buildCard(
              title: 'Syriatel',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '12 Jan'),
          buildCard(
              title: 'MTN',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '13 Jan'),
          buildCard(
              title: 'Abili',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '14 Jan'),
          buildCard(
              title: 'IShow',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '29 Jan'),
          buildCard(
              title: 'Syriatel',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '12 Jan'),
          buildCard(
              title: 'MTN',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '13 Jan'),
          buildCard(
              title: 'Abili',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '14 Jan'),
          buildCard(
              title: 'IShow',
              subtitle: '1300 دقيقة و5 جيجا بايت باقة سيرف',
              date: '29 Jan'),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {},
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Card buildCard({String title, String subtitle, String date}) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 30,
          child: Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          textDirection: TextDirection.rtl,
        ),
        trailing: Text(date),
      ),
    );
  }
}
