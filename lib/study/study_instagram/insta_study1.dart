import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../style/style.dart';


class insta_study1 extends StatefulWidget {
  insta_study1({Key? key}) : super(key: key);

  @override
  State<insta_study1> createState() => insta_study1State();
}

class insta_study1State extends State<insta_study1> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(),
        body: Text(''),
      )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Icon(Icons.star),
    );
  }
}

