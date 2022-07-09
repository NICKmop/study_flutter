import 'package:flutter/material.dart';

class study1 extends StatelessWidget {
  const study1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // chapter 1
        // appBar: ,                   상단
        // body: ,                     중단
        // bottomNavigationBar: ,      하단

        // chapter 2
        // appBar: AppBar(title: Text('app title'),),
        // body: Text('hello'),
        // bottomNavigationBar: BottomAppBar(
        //   child: Text('bottom title add'),
        // ),

        // chapter 3
        // body:
        // 가로로 나열해줌 RoW
        // Row(
        //   children: [
        //     Icon(Icons.star), Icon(Icons.star), Icon(Icons.star)
        //   ],
        // ),
        // 세로로 나열해줌 Column
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly, //위젯 간격 조절
        //   children: [
        //     Icon(Icons.star), Icon(Icons.star), Icon(Icons.star),
        //   ],
        // )

        // chapter 4
        body: Container(
          color: Colors.grey,
          height: 400,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, //세로로 배치하는 간격 조절하기
            children: const[
              Icon(Icons.safety_check),
              Icon(Icons.safety_check),
              Icon(Icons.safety_check),
            ],
          ),
        ),
      ),
    );
  }
}
