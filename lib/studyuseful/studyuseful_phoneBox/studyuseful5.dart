import 'package:flutter/material.dart';

class studyuseful5 extends StatefulWidget {
  const studyuseful5({Key? key}) : super(key: key);

  @override
  State<studyuseful5> createState() => studyuseful5State();
}

class studyuseful5State extends State<studyuseful5> {
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

class DialogUI extends StatelessWidget {
  // DialogUI({Key? key}) : super(key: key);
  DialogUI(this.value1, this.value2);

  final value1;
  final value2;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            TextButton(onPressed: (){
              setState(){
                print("1111");
              }
            }, child: Text('완료'))
          ],
        ),
      ),
    );
  }
}
