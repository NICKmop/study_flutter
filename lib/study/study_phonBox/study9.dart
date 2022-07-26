import 'package:flutter/material.dart';

class study9 extends StatefulWidget {
  const study9({Key? key}) : super(key: key);

  @override
  State<study9> createState() => _study9State();
}


class _study9State extends State<study9> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Builder(
          builder: (jokbo1) {
            return FloatingActionButton(onPressed: (){
              showDialog(context: jokbo1,
                  builder: (context){
                    return Dialog( child: Text("test"),);
              });
            });
          },
        ),
      ),
    );
  }
}
