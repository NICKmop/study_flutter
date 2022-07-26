import 'package:flutter/material.dart';

class studyuseful6_solve extends StatefulWidget {
  const studyuseful6_solve({Key? key}) : super(key: key);
  @override
  State<studyuseful6_solve> createState() => studyuseful6_solveState();
}

class studyuseful6_solveState extends State<studyuseful6_solve> {

  var total = 3; //앱의 저장된 친구 수
  var a = 3;
  var name = ['김영숙','홍길동','류영훈'];
  var like = [0,0,0];

  //함수 만드는 법
  addName(){
    setState((){
      name.add('말쑥');
    });
  }

  addOne(inputData2){
    print(inputData2); //사용자 정보
    setState((){
      total++;
      name.add(inputData2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(total.toString()),
        ),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: ( c, i ){
              return ListTile(
                leading: Image.asset('logo.png', width: 100,),
                title: Text(name[i]),
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              return DialogUI(
                  addOne : addOne,
                  addName : addName,
              );
            });
          },
        ),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne, this.addName}) : super(key: key);
  final addOne;
  final addName;

  var inputData = TextEditingController(); // 변수 저장소
  var inputData2 = '';
  var inputData3 = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        width: 300,
        height: 300,
        child: Column(
          children: [
            // TextField( controller: inputData,),
            TextField( onChanged: (text){ inputData2 = text; },),
            TextButton(
                child: Text('완료') ,
                onPressed: (){
                  addOne(inputData2);
                  addName();
                  Navigator.pop(context);
                }
            ),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('취소'))
          ],
        ),
      ),
    );
  }
}
