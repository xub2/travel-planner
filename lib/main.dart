import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'views/input_user_inform.dart';

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 위쪽으로 정렬
          children: [
            const SizedBox(height: 100), // 상단 여백 추가
            Image.asset(
              'lib/assets/images/로고.png', // 이미지 경로
              width: 500, // 이미지 크기 조정
              height: 500,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250, // 버튼의 너비를 명시적으로 설정
              height: 60, // 버튼의 높이를 명시적으로 설정
              child: ElevatedButton(
                onPressed: () {
                  // 버튼 클릭 시 InputUserInform 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InputUserInform()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 18, // 텍스트 크기 설정
                    color: Colors.white, // 텍스트 색상 설정
                  ),
                ),
                child: const Text(
                  "여행 일정 만들기",
                  style: TextStyle(color: Colors.white), // 텍스트 색상 설정
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
