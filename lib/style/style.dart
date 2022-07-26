import 'package:flutter/material.dart';

var theme = ThemeData(
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color : Colors.blue,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.red, size: 60),
  appBarTheme: AppBarTheme(color: Colors.grey,),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 2,
    selectedItemColor: Colors.black,
  )
);