import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'budget_and_style.dart';
import 'travel_data.dart';

class InputUserInform extends StatefulWidget {
  const InputUserInform({super.key});

  @override
  _InputUserInformState createState() => _InputUserInformState();
}

class _InputUserInformState extends State<InputUserInform> {
  final TravelData travelData = TravelData(styles: []);
  final TextEditingController _destinationController = TextEditingController();

  DateTime _focusedDepartureDay = DateTime.now();
  DateTime? _selectedDepartureDay;
  DateTime _focusedArrivalDay = DateTime.now();
  DateTime? _selectedArrivalDay;

  bool _isFormCompleted = false;

  // 오류 메시지를 표시하는 함수
  void showErrorMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('도착 날짜가 출발 날짜보다 이릅니다.'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // 날짜를 비교하는 함수
  void checkDate(BuildContext context) {
    if (_selectedDepartureDay != null && _selectedArrivalDay != null) {
      if (_selectedArrivalDay!.isBefore(_selectedDepartureDay!)) {
        showErrorMessage(context);
        _isFormCompleted = false; // 날짜가 잘못된 경우 버튼 비활성화
      } else {
        _isFormCompleted = true;
      }
    } else {
      _isFormCompleted = false; // 날짜가 선택되지 않았으면 버튼 비활성화
    }
  }

  void _checkFormCompletion() {
    setState(() {
      travelData.destination = _destinationController.text;
      travelData.departureDate = _selectedDepartureDay;
      travelData.arrivalDate = _selectedArrivalDay;

      bool? isDestinationFilled = travelData.destination?.isNotEmpty;
      bool areDatesSelected = travelData.departureDate != null && travelData.arrivalDate != null;

      // 모든 입력 값이 완료되고 날짜 순서가 올바른지 확인
      _isFormCompleted = isDestinationFilled! && areDatesSelected;

      // 날짜 순서를 확인하여 버튼 활성화 여부 결정
      if (_isFormCompleted) {
        checkDate(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _destinationController.addListener(_checkFormCompletion);
    initializeDateFormatting();
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
                    locale: 'ko_KR',
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
                    calendarFormat: CalendarFormat.month,
                    availableCalendarFormats: {CalendarFormat.month: 'Month'},
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        //color: Colors.white70,
                        //shape: BoxShape.rectangle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.blueAccent,
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
                       //color: Colors.white70,
                        //shape: BoxShape.rectangle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.blueAccent,
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
            // 데이터 확인용 출력
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
