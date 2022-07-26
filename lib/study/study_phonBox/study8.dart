import 'package:flutter/material.dart';

class study8 extends StatefulWidget {
  const study8({Key? key}) : super(key: key);

  @override
  State<study8> createState() => _study8State();
}


class _study8State extends State<study8> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         floatingActionButton: FloatingActionButton(
           onPressed: (){
             showDialog(context: context, builder: (context){
               return Dialog(
                 child: Text("AlertDialog title"),
               );
             });
           },
         ),
      ),
    );
  }
}
