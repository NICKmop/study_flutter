import 'package:flutter/material.dart';

class study5 extends StatefulWidget {
  const study5({Key? key}) : super(key: key);

  @override
  State<study5> createState() => _study5State();
}


//커스텀 위젯 만들어 보기
class _study5State extends State<study5> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          child: Text('안녕'),
        ),
      ),
    );
  }
}

// 커스텀 위젯 임
class study5com extends StatelessWidget {
  const study5com({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
