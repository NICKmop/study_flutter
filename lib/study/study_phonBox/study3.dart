import 'package:flutter/material.dart';

class study3 extends StatelessWidget {
  const study3 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body:
        Container(
          margin: EdgeInsets.all(30), //마진 주는 법
          padding: EdgeInsets.fromLTRB(10, 20, 30, 40), //왼쪽 위 오른쪽 아래
          decoration: BoxDecoration(
            border : Border.all(color: Colors.black),
            // color, shape, boxShadow, gradient, image, borderRadius 옵션들
          ),
        ),
      ),
    );
  }
}
