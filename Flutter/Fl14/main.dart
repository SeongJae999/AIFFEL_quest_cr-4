import 'package:flutter/material.dart';

void main() {
  runApp(KkujuneleoApp());
}

class KkujuneleoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kkujuneleo Challenge',
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/main': (context) => MainScreen(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(userId: ''),  // userID: ' ' 이 없으면 Welcome 화면에서 ID가 전달되지 않았음
        '/challengeMain': (context) => ChallengeMain(userId: ''),
        '/mychallenge1': (context) => MyChallenge1(userId: ''),
        '/challengeCreation': (context) => ChallengeCreation(),
        '/mypage': (context) => MyPage(userId: ''),
      },
    );
  }
}

// Onboarding Screen
class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 193, 165, 1.0), // 배경색 설정
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/onboard.png'),  // 온보딩 이미지
            SizedBox(height: 20),
            Text(
              '꾸준러북스',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 메인 화면으로 이동하는 버튼
                Navigator.pushNamed(context, '/main');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(128, 81, 90, 1.0), // 버튼 배경색 설정
                foregroundColor: Colors.white, // 버튼 글자색을 하얀색으로 설정
              ),
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}

// Main Screen
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 193, 165, 1.0), // 배경색 설정
      appBar: AppBar(
        title: Text('꾸준러북스'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/book_icon.png'),  // 온보딩 이미지
            SizedBox(height: 20),
            Text(
              '꾸준하게 책 읽는 습관 만들기',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 로그인 화면으로 이동하는 버튼
                Navigator.pushNamed(context, '/login');
              },
              child: Text('로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                // 추후에...
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}

// Login Screen - StatefulWidget이 아닌 StatelessWidget을 사용 디버깅
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 193, 165, 1.0), // 배경색 설정
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(),
                    filled: true, // 배경색 사용 설정
                    fillColor: Color.fromRGBO(111, 182, 186, 1.0), // ID 입력 필드 배경색 설정
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: 'PW',
                    border: OutlineInputBorder(),
                    filled: true, // 배경색 사용 설정
                    fillColor: Color.fromRGBO(111, 182, 186, 1.0), // ID 입력 필드 배경색 설정
                ),
                obscureText: true, // 비밀번호 숨기기
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String id = _idController.text; // ID 입력값 가져오기
                  // 로그인 후 WelcomeScreen으로 이동하며 ID 전달
                  // Navigator.pushNamed(context, '/welcome', arguments: _idController.text);  //입력된 ID값 전달

                  // 전달되는 ID 값을 출력하여 디버깅
                  print('입력된 ID: $id');

                  // ID를 welcomeScreen으로 전달
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(userId: id),
                    ),
                  );
                },
                child: Text('로그인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  final String userId;

  // 생성자를 통해 userId를 받음
  WelcomeScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    // 전달된 ID를 받아옴 - ID가 전달되지 않아 null처리도 추가
    // final String? userId = ModalRoute.of(context)?.settings.arguments as String?;

    // 전달된 ID를 출력하여 디버깅
    print('전달받은 ID: $userId');

    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 193, 165, 1.0), // 배경색 설정
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //전달받은 ID로 환영 메시지
            Text(
              '$userId님의 꾸준러박스 챌린지',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/images/challenge.png'),  // 챌린지 이미지
            ElevatedButton(
              onPressed: () {
                // ChallengeMain으로 ID 전달
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChallengeMain(userId: userId),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(128, 81, 90, 1.0), // 버튼 배경색 설정
                foregroundColor: Colors.white, // 버튼 글자색을 하얀색으로 설정
              ),

              child: Text('Start Challenge'),

            ),
          ],
        ),
      ),
    );
  }
}

// Challenge Main - 버튼 선택 시 색 변경하기 위해 StatefulWidget으로
class ChallengeMain extends StatefulWidget {
  final String userId; // ID를 전달받기 위해 생성자 추가

  ChallengeMain({required this.userId}); // 생성자에서 userId 받음

  @override
  _ChallengeMainState createState() => _ChallengeMainState();
}

class _ChallengeMainState extends State<ChallengeMain> {
  int? _selectedChallenge; // 선택된 챌린지 번호를 저장하는 변수 (1 또는 2)
  int _currentIndex = 0; // 하단 네비게이션 바 선택 인덱스
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 193, 165, 1.0), // 배경색 설정
      appBar: AppBar(
        title: Text('Challenge Main'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedChallenge = 1; // 첫 번째 챌린지 선택
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => MyChallenge1(userId: widget.userId),
                    builder: (context) => MyPage(userId: widget.userId),
                  ),
                ); // 영어책 읽기 선택 시 MyChallenge1 화면으로 이동
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedChallenge == 1
                    ? Color.fromRGBO(111, 182, 186, 1.0) // 선택된 경우 하늘색으로
                    : Color.fromRGBO(128, 81, 90, 1.0), // 선택되지 않은 경우 원래 색상
                foregroundColor: _selectedChallenge == 1
                    ? Colors.black // 선택된 경우 글자색 검은색
                    : Colors.white, // 선택되지 않은 경우 글자색 하얀색
              ),
              child: Text('1. 영어책 읽기'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedChallenge = 2; // 두 번째 챌린지 선택
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedChallenge == 2
                    ? Color.fromRGBO(111, 182, 186, 1.0) // 선택된 경우 하늘색으로
                    : Color.fromRGBO(128, 81, 90, 1.0), // 선택되지 않은 경우 원래 색상
                foregroundColor: _selectedChallenge == 2
                    ? Colors.black // 선택된 경우 글자색 검은색
                    : Colors.white, // 선택되지 않은 경우 글자색 하얀색
              ),
              child: Text('2. 자기계발책 읽기'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // 화면 전환을 구현할 수 있음
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home'); // 홈 화면으로 전환
              break;
            case 1:
              Navigator.pushNamed(context, '/menu'); // 메뉴 화면으로 전환
              break;
            case 2:
              Navigator.pushNamed(context, '/mypage'); // 마이페이지 화면으로 전환
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // 홈 아이콘
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu), // 메뉴 아이콘
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // 마이페이지 아이콘
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

class MyChallenge1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 193, 165, 1.0), // 배경색 설정
      appBar: AppBar(
        title: Text('My Challenge 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/stamp_re.png'), // 이미지
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // 현재 화면의 index는 0 (홈)
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/challengeMain'); // 홈으로
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/challengeCreation'); // 챌린지 만들기 화면으로
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/mypage'); // 마이페이지 화면으로
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // 홈 아이콘
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu), // 메뉴 아이콘
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // 마이페이지 아이콘
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

class ChallengeCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 193, 165, 1.0), // 배경색 설정
      appBar: AppBar(
        title: Text('Challenge Creation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/new_challenge.png'), // 이미지
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // 현재 화면의 index는 1 (메뉴)
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/challengeMain'); // 홈으로
              break;
            case 1:
            // 현재 화면이므로 아무것도 하지 않음
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/mypage'); // 마이페이지 화면으로
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // 홈 아이콘
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu), // 메뉴 아이콘
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // 마이페이지 아이콘
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String userId;

  MyPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 193, 165, 1.0), // 배경색 설정
      appBar: AppBar(
        title: Text('MyPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('$userId님의 스탬프 현황', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text(
              '꾸준러북스 챌린지 스탬프 현황',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('assets/images/myresult.png'),  // 온보딩 이미지
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // 현재 화면의 index는 2 (마이페이지)
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/challengeMain'); // 홈으로
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/challengeCreation'); // 챌린지 만들기 화면으로
              break;
            case 2:
            // 현재 화면이므로 아무것도 하지 않음
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // 홈 아이콘
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu), // 메뉴 아이콘
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // 마이페이지 아이콘
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}
