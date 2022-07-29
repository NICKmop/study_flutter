import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../../style/style.dart' as column;
import 'dart:convert';
import 'package:http/http.dart' as http;

class insta_study1 extends StatefulWidget {
  insta_study1({Key? key}) : super(key: key);

  @override
  State<insta_study1> createState() => insta_study1State();
}

class insta_study1State extends State<insta_study1> {
  var tab = 0;
  var list = [1,2,3];
  var mpa = {'name' : 'john', 'age': 20};
  var data = [];
  var userImage;
  var userContent;

  addMyData(){
    var myData = {
      'id': data.length,
      'image': userImage,
      'likes': 5,
      'date': 'July 25',
      'content': userContent,
      'liked': false,
      'user': 'John Kim'
    };
    setState(() {
      data.insert(0, myData);
    });
  }

  setUserContent(a){
    setState((){
      userContent = a;
    });
  }
  // 첫 로드시 처음으로 로드 되는 위젯.
  @override
  void initState() {
    super.initState();
    getData();
    column.scroll.addListener(() {
      if(column.scroll.position.pixels == column.scroll.position.maxScrollExtent) {
        print("max scroll");
        getMore();
      }
    });
  }
  addData(a) {
    setState((){
      data.add(a);
    });
  }

  getMore() async {
    var res = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var res2 = jsonDecode(res.body);
    addData(res2);
  }

  // map[name] -> john 이나옴
  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if(result.statusCode == 200){
      var result2 = jsonDecode(result.body);
      setState((){
        data = result2;
      });
    } else{
      print("없습니다..");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [
          IconButton(
            iconSize: 50,
            onPressed: () async{
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if(Image != null){
                setState((){
                  userImage =  File(image!.path);
                });
              }
              // context 맨윗단 build에 있는거를 가져옴
              Navigator.push( context,
                MaterialPageRoute(builder: (c){
                  return upload(
                      userImage,
                      setUserContent : setUserContent(userContent),
                      addMyData : addMyData,
                  );
                })
              );
            },
            icon: Icon(Icons.add_box_outlined),
          )
        ],
      ),
      body: column.listView_body(data: data),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i){
          setState((){
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(label: "home", icon: IconButton(
              onPressed: (){
              }, icon:Icon(Icons.home))
          ),
          BottomNavigationBarItem(label: "box", icon: IconButton(
              onPressed: (){
              }, icon:Icon(Icons.shopping_bag_outlined))
          ),
        ],
      ),
    );
  }
}

class upload extends StatelessWidget {
  const upload(this.userImage, {Key? key,this.addMyData, this.setUserContent}) : super(key: key);

  final userImage;
  final setUserContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                addMyData();
              },
              icon: Icon(Icons.send),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImage),
          Text("이미지 업로드 화면"),
          TextField(onChanged: (value){
            setUserContent(value);
          },),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.close))
        ],
      ),
    );
  }
}

