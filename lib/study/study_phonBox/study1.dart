import 'package:flutter/material.dart';

class study1 extends StatelessWidget {
  const study1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text("study for dart"),
      // home: Icon(Icons.star),
      // home: Image.asset('assets/dog.png'),

      //네모 박스가 필요할 경우
      // home: Container(width: 50, height: 50, color: Colors.black),

      //네모 박스 안 위젯 추가
      home: Container(
        child: Text('글자 박스 추가'),
    ),
    );
  }
}
