import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

TextStyle openStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: "Raleway",
);

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
  String url = "https://api.github.com/users/";

  getData() async {
    String profile = url + user.text;
    print(profile);
    var res = await http.get(profile, headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    name = resBody['name'];
    id = resBody['id'];
    pRepos = resBody['public_repos'];
    setState(() {
      print("Success!");
      print(user);
    });
  }

  //getData(String voe){}

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
              height: 24.0,
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
              height: 36.0,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  "Name: $name",
                  style: openStyle,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              height: 60.0,
              width: MediaQuery.of(context).size.width - 64,
            ),
            SizedBox(
              height: 18.0,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  "ID: $id",
                  style: openStyle,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              height: 60.0,
              width: MediaQuery.of(context).size.width - 64,
            ),
            SizedBox(
              height: 18.0,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  "Public Repos: $pRepos",
                  style: openStyle,
                ),
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
        onPressed: getData,
        child: Icon(Icons.get_app),
      ),
    );
  }
}
