// input_user_inform.dart
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'budget_and_style.dart';
import 'travel_data.dart';
import 'package:intl/intl_standalone.dart';

class InputUserInform extends StatefulWidget {
  const InputUserInform({super.key});

  @override
  _InputUserInformState createState() => _InputUserInformState();
}

class _InputUserInformState extends State<InputUserInform> {
  final TravelData travelData = TravelData();
  final TextEditingController _destinationController = TextEditingController();

  DateTime _focusedDepartureDay = DateTime.now();
  DateTime? _selectedDepartureDay;
  DateTime _focusedArrivalDay = DateTime.now();
  DateTime? _selectedArrivalDay;

  bool _isFormCompleted = false;

  void _checkFormCompletion() {
    setState(() {
      travelData.destination = _destinationController.text;
      travelData.departureDate = _selectedDepartureDay;
      travelData.arrivalDate = _selectedArrivalDay;
      _isFormCompleted = travelData.destination != null &&
          travelData.departureDate != null &&
          travelData.arrivalDate != null;
    });
  }

  @override
  void initState() {
    super.initState();
    _destinationController.addListener(_checkFormCompletion);
    initializeDateFormatting(); // 날짜 형식 초기화
  }

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "목적지를 알려주세요\n계획은 제가 만들어 드릴게요!",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                      controller: _destinationController,
                      decoration: InputDecoration(
                        hintText: "어디로 여행을 떠나실 건가요?",
                        hintStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(15),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Divider(color: Colors.white70, thickness: 1.0),
                  const SizedBox(height: 20.0),
                  const Text(
                    "✈ 출발 날짜를 알려주세요 (Departure)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TableCalendar(
                    locale: 'ko_KR', // 한국어로 설정
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2100),
                    focusedDay: _focusedDepartureDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDepartureDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDepartureDay = selectedDay;
                        _focusedDepartureDay = focusedDay;
                      });
                      _checkFormCompletion();
                    },
                    calendarFormat: CalendarFormat.month, // 기본 월간 보기로 설정
                    availableCalendarFormats: {CalendarFormat.month: 'Month'}, // 다른 보기 제거
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: const TextStyle(color: Colors.white),
                      weekendTextStyle: const TextStyle(color: Colors.white70),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false, // format 버튼 숨기기
                      titleCentered: true,
                      titleTextStyle: const TextStyle(color: Colors.white),
                      leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Divider(color: Colors.white70, thickness: 1.0),
                  const SizedBox(height: 20.0),
                  const Text(
                    "✈ 도착 날짜를 알려주세요 (Arrival)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TableCalendar(
                    locale: 'ko_KR',
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2100),
                    focusedDay: _focusedArrivalDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedArrivalDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedArrivalDay = selectedDay;
                        _focusedArrivalDay = focusedDay;
                      });
                      _checkFormCompletion();
                    },
                    calendarFormat: CalendarFormat.month,
                    availableCalendarFormats: {CalendarFormat.month: 'Month'},
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: const TextStyle(color: Colors.white),
                      weekendTextStyle: const TextStyle(color: Colors.white70),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: const TextStyle(color: Colors.white),
                      leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: ElevatedButton(
          onPressed: _isFormCompleted
              ? () {
            //데이터 확인용 출력
            print('Destination: ${travelData.destination}');
            print('Departure Date: ${travelData.departureDate}');
            print('Arrival Date: ${travelData.arrivalDate}');

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BudgetAndStyle(travelData: travelData),
              ),
            );
          }
              : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: _isFormCompleted ? Colors.blueAccent : Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
          child: const Text("다음으로", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
