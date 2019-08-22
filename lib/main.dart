import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json!',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  int id = 0;
  int pRepos = 0;
  TextEditingController user = TextEditingController();

  getData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Json!"),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(
                    hintText: "Enter GitHub Username",
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              height: 60.0,
              width: MediaQuery.of(context).size.width - 34,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text("Name: $name"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              height: 60.0,
              width: MediaQuery.of(context).size.width - 64,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text("ID: $id"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              height: 60.0,
              width: MediaQuery.of(context).size.width - 64,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text("Public Repos: $pRepos"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              height: 60.0,
              width: MediaQuery.of(context).size.width - 64,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData(),
        child: Icon(Icons.get_app),
      ),
    );
  }
}
