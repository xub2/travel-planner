import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final String result;

  const ResultView({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47), // 배경 색상
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 32, 47), // AppBar 배경 색상을 동일하게 설정
        title: const Text(
          "당신만을 위한 여행 계획이에요!",
          style: TextStyle(
            fontWeight: FontWeight.bold, // 텍스트를 볼드체로 설정
          ),
        ),
        elevation: 0, // AppBar 그림자 제거
      ),
      body: SingleChildScrollView( // 스크롤 가능하도록 추가
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            result,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
