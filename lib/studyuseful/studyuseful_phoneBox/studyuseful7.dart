// 권한 관련 적용법
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

class studyuseful7 extends StatefulWidget {
  const studyuseful7({Key? key}) : super(key: key);
  @override
  State<studyuseful7> createState() => studyuseful7State();
}

class studyuseful7State extends State<studyuseful7> {

  //async 가 있어야 await 사용 가능임.
  getPermission() async {
    // await -> 기다려달라는 함수임. 기다리고 다음 줄 실행해라.
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      // 연락처에 사람 이름 추가
      // contacts[0].givenName = '민수';
      // contacts[0].familyName = '김';
      // ContactsService.addContanct(newPerson);
      setState((){
        name = contacts;
        // contacts.add(name[0]);
      });
    } else if (status.isDenied) {
      print('거절됨');
      // 팝업창 실행을 해달라는 함수임
      Permission.contacts.request();
    }
  }

  // app이 켜질때 widget이 처름 로드될때 한번 실행 하는 함수
  @override
  void initState() {
    super.initState();
    getPermission();
  }


  var total = 3; //앱의 저장된 친구 수
  var a = 3;
  var name = [];
  var like = [0,0,0];
  var textValue = '';

  //함수 만드는 법
  addOne(inputData2){
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
                title: Text(name[i].displayName),
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
            TextField( onChanged: (text){ inputData = TextEditingController(text: text); },),
            TextButton(
                child: Text('완료') ,
                onPressed: (){

                  var newContact = Contact();

                  newContact.displayName = inputData.text;
                  newContact.givenName = inputData.text;

                  ContactsService.addContact(newContact);
                  addOne(newContact);

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
