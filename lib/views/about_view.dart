import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자주 묻는 질문"),
        backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView( // 스크롤 가능하도록 추가
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 좌측 정렬로 설정
              children: const [
                Text(
                  "- 어떤 앱인가요?",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
                SizedBox(height: 20), // 한 줄 공백 추가
                Text(
                  "여행은 가고 싶지만, 계획은 짜기 귀찮은 당신을 위해 개발 되었습니다",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
                SizedBox(height: 40), // 한 줄 공백 추가
                Text(
                  "- 어떻게 사용하나요?",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
                SizedBox(height: 20), // 한 줄 공백 추가
                Text(
                  "목적지, 날짜, 예산, 스타일만 알려주세요! \n알려주신 정보를 바탕으로 계획을 만들어 드립니다.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
                SizedBox(height: 40), // 한 줄 공백 추가
                Text(
                  "- 계획을 저장하고 싶어요",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
                SizedBox(height: 20), // 한 줄 공백 추가
                Text(
                  "아직 저장 기능은 준비 중입니다. 다음 업데이트에서 추가될 예정입니다!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
                SizedBox(height: 40), // 한 줄 공백 추가
                Text(
                  "- 로딩 화면에서 오류가 발생해요",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
                SizedBox(height: 20), // 한 줄 공백 추가
                Text(
                  "서버 문제입니다. 서버를 재부팅하여 다시 실행해보세요!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
                SizedBox(height: 40), // 한 줄 공백 추가
                Text(
                  "Developed by xub2",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold, // 볼드체 적용
                  ),
                  textAlign: TextAlign.left, // 텍스트 좌측 정렬
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
