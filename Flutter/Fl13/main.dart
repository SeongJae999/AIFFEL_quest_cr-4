import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isCat = true; // 고양이 여부 나타내는 변수, 초기값 true로 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        leading: Icon(Icons.pets),  // 아이콘-강아지모양
        centerTitle: true, // 제목을 중앙에 배치
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙
          crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙
          children: [
            ElevatedButton(
              onPressed: () {
                // Next 버튼 클릭 시 isCat을 false로 설정하고 SecondPage로 이동
                setState(() {
                  isCat = false; // isCat을 false로 변경
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(isCat: isCat), // SecondPage로 isCat 값 전달
                  ),
                );
              },
              child: Text('Next'), // "Next" 버튼
            ),
            SizedBox(height: 20), // 버튼과 이미지 사이의 간격
            GestureDetector(
              onTap: () {
                // 이미지 클릭 시 현재 isCat 상태를 디버그 콘솔에 출력
                print('is_cat: $isCat');
              },
              child: Image.asset(
                'assets/images/cat.png', // 고양이 이미지
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final bool isCat; // 첫 번째 화면에서 전달받은 값

  SecondPage({required this.isCat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        leading: Icon(Icons.pets),  // 아이콘-강아지모양
        centerTitle: true, // 제목을 중앙에 배치
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙
          crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙
          children: [
            ElevatedButton(
              onPressed: () {
                // Back 버튼 클릭 시 페이지 스택을 모두 삭제하고 isCat을 true로 설정한 첫 번째 화면으로 이동
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(), // 첫 번째 페이지로 이동
                  ),
                      (route) => false, // 모든 페이지 스택 삭제
                );
              },
              child: Text('Back'), // "Back" 버튼
            ),
            SizedBox(height: 20), // 버튼과 이미지 사이의 간격
            GestureDetector(
              onTap: () {
                // 이미지 클릭 시 현재 isCat 상태를 DEBUG CONSOLE에 출력
                print('is_cat: $isCat');
              },
              child: Image.asset(
                'assets/images/dog.png', // 강아지 이미지
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 회고
// 생성했던 페이지 stack을 삭제해야한다는 조건이 누락되었을 때, 계속 true가 출력되면서 이미지 그림이 변경되지 않았다.
// 조건을 잘 읽고 문제를 해결해야 할 것 같다.