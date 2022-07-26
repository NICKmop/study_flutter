import 'package:flutter/material.dart';

class study6 extends StatefulWidget {
  const study6({Key? key}) : super(key: key);

  @override
  State<study6> createState() => _study7State();
}


class _study7State extends State<study6> {

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         floatingActionButton: FloatingActionButton(
           child: Text(a.toString()),
           onPressed: (){
             setState(){
               a++;
             }
           },
         ),
      ),
    );
  }
}
