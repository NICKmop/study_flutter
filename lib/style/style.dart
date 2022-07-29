import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../study/study_instagram/insta_study1.dart' as img;
import 'package:get/get.dart';

var scroll = ScrollController(); // 스크롤 저장함

var theme = ThemeData(
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black, size: 50),
    color: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 2,
    selectedItemColor: Colors.black,
  )
);

Widget listView_body({required data}){
  return ListView.builder(
    controller: scroll,
    itemCount: 3,
    itemBuilder: (c,i){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(data[i]['image']),
          Text("종아요 ${data[i]['likes']}"),
          Text("글쓴이 ${data[i]['user']}"),
          Text("글내용 ${data[i]['content']}"),
        ],
      );
    }
  );
}

