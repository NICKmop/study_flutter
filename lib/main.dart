import 'package:flutter/material.dart';
import 'package:study_flutter/study/study_instagram/insta_study1.dart';
import 'package:study_flutter/studyuseful/studyuseful_instagram/insta_studyuseful1.dart';
import 'package:study_flutter/studyResult/phoneNumber.dart';
import 'package:study_flutter/studyResult/mapApi.dart';
import 'package:get/get.dart';
import 'style/style.dart' as style;

void main() {
  runApp(
    GetMaterialApp(
      // theme : ThemeData(),
      theme : style.theme,
      title: 'flutter demo',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => insta_studyuseful1()),
        GetPage(name: '/second', page: () => phoneNumber()),
        GetPage(name: '/three', page: () => mapApi()),
      ],
    )
  );
}
