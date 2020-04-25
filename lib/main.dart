import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonfetch/model/Country.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  List<Country> _listofvalues = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _listofvalues.length != 0
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Update Date :'+
                      _listofvalues[0].update_date_time,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('New Cases: '+
                      _listofvalues[0].local_new_cases.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('Recoverd: '+
                      _listofvalues[0].local_recovered.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('Death :'+
                      _listofvalues[0].local_deaths.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ))
            : Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  void FetchData() async {
    var response = await http
        .get('https://www.hpb.health.gov.lk/api/get-current-statistical');
    if (response.statusCode == 200) {
      var Data = Country.fromJson(json.decode(response.body));
      setState(() {
        _listofvalues.add(Data);
      });
    }
  }
}
