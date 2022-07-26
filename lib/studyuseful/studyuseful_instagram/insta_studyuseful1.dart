import 'package:flutter/material.dart';

class insta_studyuseful1 extends StatefulWidget {
  insta_studyuseful1({Key? key}) : super(key: key);
  @override
  State<insta_studyuseful1> createState() => insta_studyuseful1State();
}

class insta_studyuseful1State extends State<insta_studyuseful1> {
  // 변수에 글자 스타일 담아서 사용도 가능.
  var text1 = TextStyle(color : Colors.red);
  // tab 상태값 적용
  var tab = 0;

  var theme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.red),
    )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
          actions: [
            Icon(Icons.add_box_outlined),
          ],
        ),
        body:
            [Text('홈페이지'), Text('샵페이지')][tab],
          // ListView.builder(
          //   itemCount: 3,
          //   itemBuilder: (c, i){
          //     return ListTile(
          //       leading:
          //         Container(
          //           width: 360,
          //           decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          //           child:
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Image(image: AssetImage('assets/logo.png')),
          //                 Text("좋아요", style: TextStyle(fontWeight: FontWeight.bold,)),
          //               ],
          //             )
          //         ),
          //         title: Text("좋아요ㅋㅋㅋ"),
          //     );
          //   },
          // ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (c){
            setState((){
              tab = c;
            });
          },
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '연락처',
            ),
          ],
        ),
        // 3Step!!!!!!!
        // 1. State UI 현재상태 저장
        // 2. state에 따라서 tab이 어떻게 보일지 작성
        // 3. 유저가 쉽게 state조작 할 수 있게
      )
    );
  }
}
