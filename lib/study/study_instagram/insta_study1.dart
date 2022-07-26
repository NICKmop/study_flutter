import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import '../../style/style.dart';
import 'package:study_flutter/studyResult/phoneNumber.dart';
import 'package:study_flutter/studyResult/mapApi.dart';
import 'package:flutter/rendering.dart';

class insta_study1 extends StatefulWidget {
  insta_study1({Key? key}) : super(key: key);

  @override
  State<insta_study1> createState() => insta_study1State();
}

class insta_study1State extends State<insta_study1> {
  var text1 = TextStyle(color : Colors.red);
  // tab 상태값 적용
  var tab = 0;
  var list = [1,2,3];
  var map = {'name':'john','age': 20};
  var data = [];
  var userImage;
  var userContent;

  setUserContent(a){
    setState((){
      userContent = a;
    });
  }

  addData(a){
    setState((){
      data.add(a);
    });
  }

  addMyData(a){
    var myData = {
      'id' : data.length,
      'image' : userImage,
      'likes' : 5,
      'date' : 'July 25',
      'content' : userContent,
      'liked' : false,
      'user' : 'john'
    };
    setState((){
      data.insert(0,myData);
    });
  }

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if(result.statusCode == 200){
      var result2 = jsonDecode(result.body);
      setState((){
        data = result2;
      });
    }else{
      print('실패 터진듯이..??');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('study_for_flutter'),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              iconSize: 30,
              onPressed: () async {
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);

                if(image != null){
                  setState((){
                    userImage = File(image.path);
                  });
                }



                Navigator.push(context,
                  MaterialPageRoute(builder: (c) => Upload(
                      userImage : userImage,
                      setUserContent : setUserContent,
                      addMyData : addMyData
                  ))
                );
              }),
          ],
        ),
        body:[Home(data: data), phoneNumber(), mapApi()][tab],
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: (i){
              setState((){
                tab = i;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.home_outlined)
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.shopping_bag_outlined)
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.map_outlined)
              ),
            ],
          ),
        ),
        // 3Step!!!!!!!
        // 1. State UI 현재상태 저장
        // 2. state에 따라서 tab이 어떻게 보일지 작성
        // 3. 유저가 쉽게 state조작 할 수 있게
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({Key? key, this.data}) : super(key: key);
//
//   final data;
//
//   @override
//   State<Home> createState() => _HomnState();
// }
//
// class _HomnState extends State<Home> {
//
//   var scroll = ScrollController(); // 자료 저장 함
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     scroll.addListener(() {
//       print(scroll.position.pixels); // 스크롤 내린 높이
//       if(scroll.position.pixels == scroll.position.maxScrollExtent){
//           print("같음");
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }

class Home extends StatelessWidget {
  Home({Key? key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    if(data.isNotEmpty){
      return ListView.builder(itemCount: 3, itemBuilder: (c, i){
        return Column(
          children: [
            // Image.network('https://codingapple1.github.io/kona.jpg'),
            Container(
              constraints: BoxConstraints(maxWidth: 600),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data[i]['image'].runtimeType == String
                      ? Image.network(data[i]['image'])
                      : Image.file(data[i]['image']),
                  // Image.network(widget.data[i]['image']),
                  Text('좋아요 : ${data[i]['likes'].toString()}'),
                  Text('글쓴이'),
                  Text('내용 : ${data[i]['content']}'),
                ],
              ),
            )
          ],
        );
      });
    }else{
      return Text('로딩중입니다.');
    }
  }
}


class Upload extends StatelessWidget {
  const Upload({Key? key , this.userImage, this.setUserContent, this.addMyData}) : super(key: key);
  final userImage;
  final setUserContent;
  final addMyData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){addMyData();}, icon: Icon(Icons.send)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImage),
          Text("이미지 업로드 화면"),
          TextField(
            onChanged: (text){
              setUserContent(text);
          },),
          IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.close))
        ],
      ),
    );
  }
}
