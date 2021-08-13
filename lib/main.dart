import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'location_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position? _position;

  @override
  void initState() {
    super.initState();
    LocationHelper.determinePosition().then((value) {
      setState(() {
        _position = value;
      });
    }).onError((error, stackTrace) {
      setState(() {
        _position = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Geolocator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${_position?.latitude}, ${_position?.longitude}"),
          ],
        ),
      ),
    );
  }
}
