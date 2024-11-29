import 'package:flutter/material.dart';
import '../utils/connect_manager.dart';
import 'travel_data.dart';
import 'result_view.dart';

class LoadingView extends StatelessWidget {
  final TravelData travelData;

  const LoadingView({Key? key, required this.travelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _sendQuery(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              "입력해 주신 정보를 바탕으로 \n"
                  "멋진 일정을 만들어 드릴게요🤖",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void _sendQuery(BuildContext context) async {
    final connectManager = ConnectManager();
    final response = await connectManager.sendQuery(travelData.toQueryString());

    // 결과 화면으로 이동
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultView(result: response ?? "일정을 생성하는데 실패했습니다. \n관리자에게 문의하세요."),
      ),
    );
  }
}
