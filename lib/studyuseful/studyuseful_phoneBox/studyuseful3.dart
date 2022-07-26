import 'package:flutter/material.dart';

class studyuseful3 extends StatefulWidget {
  const studyuseful3({Key? key}) : super(key: key);

  @override
  State<studyuseful3> createState() => _State();
}

class _State extends State<studyuseful3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context ,i){
          return ListTile(
            title: Text('홍성남'),
            trailing: ElevatedButton(
              child: Text('좋아요'), onPressed: (){
                setState(){
                  print("좋아요 버튼 누르면 하나씩 증가댐");
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
