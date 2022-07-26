import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart';

class instaGram extends StatefulWidget {
  const instaGram({Key? key}) : super(key: key);

  @override
  State<instaGram> createState() => instaGramState();
}

class instaGramState extends State<instaGram> {

  var tab = 0;
  var data = [];
  var userImage;
  var userContent;

  addMyData(){
    var myData = {
      'id': data.length,
      'image': userImage,
      'likes': 5,
      'date': 'July 25',
      'content': userContent,
      'liked': false,
      'user': 'John Kim'
    };
    setState(() {
      data.insert(0, myData);
    });
  }

  setUserContent(a){
    setState(() {
      userContent = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){ addMyData(); }, icon: Icon(Icons.send))
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Image.file(userImage),
          Text("이미지 업로드 화면"),
          TextField(onChanged: (text){ setUserContent(text); }),
          IconButton(onPressed: (){
          Navigator.pop(context);
      }, icon: Icon(Icons.close))
      ],
    ),
    );
  }
}
