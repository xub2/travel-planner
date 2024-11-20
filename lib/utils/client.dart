// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class TravelData {
//   String? destination;
//   DateTime? departureDate;
//   DateTime? arrivalDate;
//   double? budget;
//   List<String> styles = [];
//
//   TravelData({
//     this.destination,
//     this.departureDate,
//     this.arrivalDate,
//     this.budget,
//     required this.styles,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'destination': destination,
//       'departureDate': departureDate?.toIso8601String(),
//       'arrivalDate': arrivalDate?.toIso8601String(),
//       'budget': budget,
//       'styles': styles,
//     };
//   }
//
//   Future<void> sendToServer() async {
//     final url = Uri.parse('http://127.0.0.1:8000/plan_trip');
//     final headers = {"Content-Type": "application/json"};
//     final body = jsonEncode(toJson());
//
//     final response = await http.post(url, headers: headers, body: body);
//     if (response.statusCode == 200) {
//       print('Server Response: ${jsonDecode(response.body)['message']}');
//     } else {
//       print('Failed to send data: ${response.statusCode}');
//     }
//   }
// }
//
//
