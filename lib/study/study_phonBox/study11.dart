// 권한 관련 적용법
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class study11 extends StatefulWidget {
  const study11({Key? key}) : super(key: key);
  @override
  State<study11> createState() => _study11State();
}

class _study11State extends State<study11> {

  //async 가 있어야 await 사용 가능임.
  getPermission() async {
    // await -> 기다려달라는 함수임. 기다리고 다음 줄 실행해라.
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
    } else if (status.isDenied) {
      print('거절됨');
      // 팝업창 실행을 해달라는 함수임
      Permission.contacts.request();
    }
  }
  
  // app이 켜질때 widget이 처름 로드될때 한번 실행 하는 함수
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
  }
  
  
  var total = 3; //앱의 저장된 친구 수
  var a = 3;
  var name = ['김영숙','홍길동','류영훈'];
  var like = [0,0,0];

  //함수 만드는 법
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
          actions: [
            IconButton(onPressed: (){
              getPermission();
            }, icon: Icon(Icons.contact_page))
          ],
        ),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: ( c, i ){
              return ListTile(
                leading: Image.asset('assets/logo.png', width: 100,),
                title: Text(name[i]),
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              return DialogUI(
                  addOne : addOne
              );
            });
          },
        ),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne}) : super(key: key);
  final addOne;

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
