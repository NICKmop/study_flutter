import 'package:flutter/material.dart';

class studyuseful extends StatefulWidget {
  const studyuseful({Key? key}) : super(key: key);

  @override
  State<studyuseful> createState() => _studyusefulState();
}

class _studyusefulState extends State<studyuseful> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Icon(Icons.phone),
                Icon(Icons.phone),
                Icon(Icons.phone),
            ],
        ),
      ),
    );
  }
}
