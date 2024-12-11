// 머터리얼 디자인과 관련된 기능을 불로오는 코드
// material.dart 파일을 불러와야
// 플러터에서 기본 제공해주는 위젯들을 사용할 수 있습니다.
import 'package:flutter/material.dart';

void main() {
  runApp(FloatingActionButtonExample());
}

class FloatingActionButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.black,
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
