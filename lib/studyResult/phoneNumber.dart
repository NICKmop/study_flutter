// 권한 관련 적용법
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import '../../style/style.dart';

class phoneNumber extends StatefulWidget {
  phoneNumber({Key? key}) : super(key: key);
  @override
  State<phoneNumber> createState() => phoneNumberState();
}

class phoneNumberState extends State<phoneNumber> {
  int total = 3; //앱의 저장된 친구 수
  List name = [];
  List phones = [];
  List like = [0,0,0];
  //async 가 있어야 await 사용 가능임.
  getPermission() async {
    // await -> 기다려달라는 함수임. 기다리고 다음 줄 실행해라.

    var status = await Permission.contacts.status;

    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();

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
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(name.length.toString()),
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
                leading: Image.asset('assets/logo.png', width: 50,),
                title: Text(name[i].displayName ?? "이름 없음"), // null check임
                subtitle:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.map_outlined),
                      Icon(Icons.people_alt_outlined)
                  ],
                ),
                // subtitle: Text(name[i].),
              );
              ListTile(
                title: Text('test'),
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
        // bottomNavigationBar: BottomNavigationBar(
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   onTap: (c){
        //     setState((){
        //       Get.toNamed('/');
        //     });
        //   },
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       // icon: Icon(Icons.home_mini_outlined),
        //       icon: IconButton(onPressed: () {
        //         setState((){
        //           Get.toNamed('/');
        //         });
        //       }, icon: Icon(Icons.home_mini_outlined)),
        //       label: '홈',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: IconButton(onPressed: () {
        //         setState((){
        //           Get.toNamed('/second');
        //         });
        //       }, icon: Icon(Icons.people_alt_outlined)),
        //       label: '연락처',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: IconButton(onPressed: () {
        //         setState((){
        //           Get.toNamed('/three');
        //         });
        //       }, icon: Icon(Icons.map_outlined)),
        //       label: '지도',
        //     ),
        //   ],
        // ),
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
            // TextField( onChanged: (text){ inputData2 = TextEditingController(text: text); },),
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
