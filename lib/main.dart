import 'package:flutter/material.dart';
import 'package:study_flutter/study/study_instagram/insta_study1.dart';
import 'style/style.dart' as style;

void main() {
  runApp(
    MaterialApp(
      theme: style.theme,
      // initialRoute: '/',
      // routes:  {
      //   '/': (c) => Text('첫 페이지'),
      //   '/detail' : (c) => Text('둘째 페이지')
      // },
      home: insta_study1(),
    )
  );
}
