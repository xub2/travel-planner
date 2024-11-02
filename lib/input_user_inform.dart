import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class InputUserInform extends StatefulWidget {
  const InputUserInform({super.key});

  @override
  _InputUserInformState createState() => _InputUserInformState();
}

class _InputUserInformState extends State<InputUserInform> {
  DateTime _focusedDepartureDay = DateTime.now();
  DateTime? _selectedDepartureDay;

  DateTime _focusedArrivalDay = DateTime.now();
  DateTime? _selectedArrivalDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47), // main과 동일한 배경색
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 65.0, left: 20.0, right: 20.0),
            child: Text(
              "목적지를 알려주세요",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
            child: Text(
              "계획은 제가 만들어드릴게요!",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "어디로 여행을 떠나실건가요?",
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800], // 배경색
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), // 모서리 둥글게
                      borderSide: BorderSide.none, // 기본 테두리 제거
                    ),
                    contentPadding: const EdgeInsets.all(15), // 내부 여백
                  ),
                  style: const TextStyle(color: Colors.white), // 입력 텍스트 색상
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Divider(
                    color: Colors.white70,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
          ),
          // 출발 일자 (Departure)와 달력
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
            child: Text(
              "✈출발 날짜를 알려주세요 (Departure)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          TableCalendar(
            locale: 'ko_KR', // 월과 요일을 한글로 설정
            firstDay: DateTime.now(),
            lastDay: DateTime(2100),
            focusedDay: _focusedDepartureDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDepartureDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDepartureDay = selectedDay;
                _focusedDepartureDay = focusedDay;
              });
            },
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
            calendarFormat: CalendarFormat.month,
          ),
          // 구분선
          const Divider(
            color: Colors.white70,
            thickness: 1.0,
            height: 40.0, // 구분선 상하 간격
          ),
          // 도착 날짜 (Arrival)과 달력
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
            child: Text(
              "️✈도착 날짜를 알려주세요 (Arrival)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          TableCalendar(
            locale: 'ko_KR', // 월과 요일을 한글로 설정
            firstDay: DateTime.now(),
            lastDay: DateTime(2100),
            focusedDay: _focusedArrivalDay,
            selectedDayPredicate: (day) => isSameDay(_selectedArrivalDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedArrivalDay = selectedDay;
                _focusedArrivalDay = focusedDay;
              });
            },
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
            calendarFormat: CalendarFormat.month,
          ),
        ],
      ),
    );
  }
}
