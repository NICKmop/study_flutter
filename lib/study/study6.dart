import 'package:flutter/material.dart';

class study6 extends StatefulWidget {
  const study6({Key? key}) : super(key: key);

  @override
  State<study6> createState() => _study6State();
}


//커스텀 위젯 만들어 보기
class _study6State extends State<study6> {

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // body:
          // 오른쪽에 글있는 레이아웃 필요할 떄
          // ListTile(
          //   leading: Image.asset('assets/logo.png'),
          //   title: Text('홍길동'),
        
          // 목록을 동적으로 많이 만들 경우 ListView.builder
          // ListView.builder(
          //     itemCount: 3, // 반복 카운트
          //     itemBuilder: (context, index) {
          //         print('Index : $index');
          //       // return Text('안녕');
          //       return ListTile(
          //         leading: Image.asset('logo.png'),
          //         title: Text('홍길동'),
          //       )
          //      },

          // FloatingActionButton 넣는 법
          floatingActionButton: FloatingActionButton(
            child: Text('버튼'),
            onPressed: (){
              a++;
              print("버튼클릭 입니다 : $a");

            },
          ),
        appBar: AppBar(),
        body: Text("바디 부분") ,
      ),
    );
  }
}
