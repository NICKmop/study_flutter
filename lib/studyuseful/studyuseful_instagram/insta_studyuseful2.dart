import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_image_provider/local_image.dart';
import 'package:local_image_provider/local_image_provider.dart';

class insta_studyuseful2 extends StatefulWidget {
  insta_studyuseful2({Key? key}) : super(key: key);
  @override
  State<insta_studyuseful2> createState() => insta_studyuseful2State();
}

class insta_studyuseful2State extends State<insta_studyuseful2> {
  // 변수에 글자 스타일 담아서 사용도 가능.
  var text1 = TextStyle(color : Colors.red);
  // tab 상태값 적용
  int tab = 0;
  // Image Picker
  int userimage = 0;

  final ImagePicker _picker = ImagePicker();
  // PickedFile _image = PickedFile('');
  File? _image;
  List<Image> picImages = [];

  Future<List<LocalImage>> getLocalImages() async {
    LocalImageProvider imageProvider = LocalImageProvider();
    bool hasPermission = await imageProvider.initialize();
    if(hasPermission) {
      List<LocalImage> images = await imageProvider.findLatest(30);
      if(images.isNotEmpty){
        return images;
      }else{
        throw "이미지를 찾을 수 없읍니다.";
      }
    }else {
      throw "이미지에 접근 할 권한이 없습니다.";
    }
  }
  Future getPickImage() async{
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState((){
      if (pickedFile != null){
        _image = File(pickedFile.path);
        setState((){
          picImages = [
            ...picImages,
            Image.file(_image!),
          ];
          print(picImages.length);
        });
      }
    });
  }

  var theme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black12,
      elevation: 1,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.red),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('photo zone'),
          actions: [
            // Icon(Icons.add_box_outlined),
            IconButton(
                onPressed: getPickImage,
                icon: Icon(Icons.add_box_outlined)),
          ],
        ),
        body:
            ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext ocntext, int index){
                  return Container(
                    key: UniqueKey(),
                    alignment: Alignment.center,
                    child:
                      Column(
                        children: picImages,
                      ),
                  );
                },
                separatorBuilder: (BuildContext bc, int index) => const Divider(),
                itemCount: picImages.length,
            ),
        bottomNavigationBar:
            BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (c){
                setState((){
                  Get.toNamed('/');
                });
              },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                // icon: Icon(Icons.home_mini_outlined),
                icon: IconButton(onPressed: () {
                  setState((){
                    Get.toNamed('/');
                  });
                }, icon: Icon(Icons.home_mini_outlined)),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: IconButton(onPressed: () {
                  setState((){
                    Get.toNamed('/second');
                  });
                }, icon: Icon(Icons.people_alt_outlined)),
                label: '연락처',
              ),
              BottomNavigationBarItem(
                icon: IconButton(onPressed: () {
                  setState((){
                    Get.toNamed('/three');
                  });
                }, icon: Icon(Icons.map_outlined)),
                label: '지도',
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
