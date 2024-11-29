import 'dart:io'; // 앱 종료를 위해 필요
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'views/input_user_inform.dart';
import 'views/about_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR'); // 지역화 데이터 초기화
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const SplashPage(), // SplashPage를 시작 페이지로 설정
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 버튼 크기를 조정하기 위한 변수
    const double buttonSize = 100.0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 전체 Column을 위로 정렬
          children: [
            const SizedBox(height: 100), // 상단 여백
            Image.asset(
              'lib/assets/images/로고.png', // 이미지 경로
              width: 500, // 이미지 크기 조정
              height: 500, // 이미지 크기 조정
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10), // 이미지와 버튼 사이 여백
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 버튼 수평 정렬
              children: [
                // 첫 번째 버튼: 여행 계획
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InputUserInform()),
                    );
                  },
                  child: Container(
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // 모서리를 둥글게
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/create.png'), // 버튼 이미지
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // 버튼 사이 간격
                // 두 번째 버튼: 정보 보기
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutView()),
                    );
                  },
                  child: Container(
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // 모서리를 둥글게
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/about.png'), // 버튼 이미지
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // 버튼 사이 간격
                // 세 번째 버튼: 앱 종료
                GestureDetector(
                  onTap: () {
                    exit(0); // 앱 종료
                  },
                  child: Container(
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // 모서리를 둥글게
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/exit.png'), // 버튼 이미지
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
