import 'dart:convert';
import 'package:http/http.dart' as http;

class ConnectManager {
  Future<String?> sendQuery(String queryString) async {
    final url = Uri.parse('http://192.168.1.46:8000/fetch-messages');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'query': queryString}),
      );

      if (response.statusCode == 200) {
        // UTF-8로 디코딩
        final decodedBody = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> responseBody = jsonDecode(decodedBody);
        return responseBody['response'];
      } else {
        print('Server error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
