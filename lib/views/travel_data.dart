import 'dart:convert';

class TravelData {
  String? destination;
  DateTime? departureDate;
  DateTime? arrivalDate;
  double? budget;
  List<String> styles = [];

  TravelData({
    this.destination,
    this.departureDate,
    this.arrivalDate,
    this.budget,
    required this.styles,
  });

  // 스타일 추가 및 제거 메서드
  void addStyle(String style) {
    if (!styles.contains(style)) {
      styles.add(style);
    }
  }

  void removeStyle(String style) {
    styles.remove(style);
  }

  // JSON 변환 메서드
  Map<String, dynamic> toJson() {
    return {
      'destination': destination,
      'departureDate': departureDate?.toIso8601String(),
      'arrivalDate': arrivalDate?.toIso8601String(),
      'budget': budget,
      'styles': styles,
    };
  }

  // JSON으로부터 TravelData 객체 생성
  factory TravelData.fromJson(Map<String, dynamic> json) {
    return TravelData(
      destination: json['destination'],
      departureDate: json['departureDate'] != null ? DateTime.parse(json['departureDate']) : null,
      arrivalDate: json['arrivalDate'] != null ? DateTime.parse(json['arrivalDate']) : null,
      budget: json['budget']?.toDouble(),
      styles: List<String>.from(json['styles']),
    );
  }

  // 여행 정보를 특정 문자열 형식으로 변환하는 메서드
  String toQueryString() {
    String departure = departureDate != null ? "${departureDate!.year}-${departureDate!.month}-${departureDate!.day}" : "알 수 없음";
    String arrival = arrivalDate != null ? "${arrivalDate!.year}-${arrivalDate!.month}-${arrivalDate!.day}" : "알 수 없음";
    String budgetString = budget != null ? budget!.toStringAsFixed(0) : "알 수 없음";
    String stylesString = styles.isNotEmpty ? styles.join(", ") : "알 수 없음";

    return "${destination ?? "알 수 없음"}에 $departure 부터 $arrival 까지 여행을 가는데, 내 예산은 $budgetString 원이고, $stylesString 를 고려하여 여행 계획을 만들어줘.";
  }

  @override
  String toString() {
    return jsonEncode(toJson()); // JSON 형태로 출력
  }
}

