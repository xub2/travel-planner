import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'input_user_inform.dart';

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
        child: ElevatedButton(
          onPressed: () {
            // 버튼 클릭 시 InputUserInform 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InputUserInform()),
            );
          },
          child: const Text("Go to Input User Inform"),
        ),
      ),
    );
  }
}
