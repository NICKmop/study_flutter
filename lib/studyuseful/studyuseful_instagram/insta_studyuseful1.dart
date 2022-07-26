import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../style/style.dart';


class insta_studyuseful1 extends StatefulWidget {
  insta_studyuseful1({Key? key}) : super(key: key);

  @override
  State<insta_studyuseful1> createState() => insta_studyuseful1State();
}

class insta_studyuseful1State extends State<insta_studyuseful1> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              Text('Instagram'),
              Icon(Icons.add_box_outlined)
            ],
          ),
          body: Text('안녕'),
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

