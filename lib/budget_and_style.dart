// budget_and_style.dart
import 'package:flutter/material.dart';
import 'main.dart';
import 'travel_data.dart';

class BudgetAndStyle extends StatefulWidget {
  final TravelData travelData;

  const BudgetAndStyle({super.key, required this.travelData});

  @override
  _BudgetAndStyleState createState() => _BudgetAndStyleState();
}

class _BudgetAndStyleState extends State<BudgetAndStyle> {
  final TextEditingController _budgetController = TextEditingController();

  void _updateTextWithCurrencySymbol(String value) {
    String text = value.replaceAll('₩', '').trim();
    if (text.isNotEmpty) {
      _budgetController.value = TextEditingValue(
        text: '₩$text',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    }
  }

  void _saveBudget() {
    String text = _budgetController.text.replaceAll('₩', '').trim();
    widget.travelData.budget = double.tryParse(text) ?? 0;

    // 데이터 확인용 출력
    print('Budget: ${widget.travelData.budget}');
    print('Full Travel Data: ${widget.travelData}');
  }

  @override
  void dispose() {
    _budgetController.dispose();
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
                      "예산을 알려주세요",
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
                      controller: _budgetController,
                      keyboardType: TextInputType.number,
                      onChanged: _updateTextWithCurrencySymbol,
                      decoration: InputDecoration(
                        hintText: "여행 예산을 입력해 주세요(단위 : ₩)",
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: ElevatedButton(
          onPressed: () {
            _saveBudget();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          ),
          child: const Text("다음으로", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
