import 'package:flutter/material.dart';

class studyuseful2 extends StatefulWidget {
  const studyuseful2({Key? key}) : super(key: key);

  @override
  State<studyuseful2> createState() => _State();
}

class _State extends State<studyuseful2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 150,
          child: Row(
            children: [
              Image.asset('logo.png', width: 150,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('카메라'),
                      Text('금호동 3 가 '),
                      Text('7000원'),
                      Row(
                        children: const [
                            Icon(Icons.favorite),
                            Text('4')
                        ],
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
