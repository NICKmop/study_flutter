import 'package:flutter/material.dart';

class study4 extends StatelessWidget {
  const study4 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Text('글자임 ', style: TextStyle(color : Colors.black))
              //색상 넣는법
              // color : Colors.red
              // color : Colors.fromRGBO(20, 130, 50, 0.8)
              // color : Color(0xffffffff)

              // flutter 버튼 종류
              // TextButton ( child : Text('버튼임'), onPressed: (){})
              // ElevatedButton( child : Text(버튼임'), onPressed: (){})
              // IconButton( icon: Icon(), onPressed: (){} )
        )
      ),
    );
  }
}
