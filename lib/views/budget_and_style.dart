import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'travel_data.dart';
import 'loading_view.dart';

class BudgetAndStyle extends StatefulWidget {
  final TravelData travelData;

  const BudgetAndStyle({super.key, required this.travelData});

  @override
  _BudgetAndStyleState createState() => _BudgetAndStyleState();
}

class _BudgetAndStyleState extends State<BudgetAndStyle> {
  final TextEditingController _budgetController = TextEditingController();

  // 스타일 리스트
  final List<String> travelStyles = ["휴식", "맛집 탐방", "레저", "쇼핑", "관광지 탐방"];

  String _formatWithCommasAndCurrency(String value) {
    // Remove non-digit characters except commas
    value = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (value.isEmpty) return '₩';

    // Format the number with commas
    final formatter = NumberFormat('#,###');
    return '₩${formatter.format(int.parse(value))}';
  }

  void _updateTextWithCurrencySymbol(String value) {
    String text = value.replaceAll(RegExp(r'[^0-9]'), '').trim();
    if (text.isNotEmpty) {
      String formattedText = _formatWithCommasAndCurrency(text);
      _budgetController.value = TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    } else {
      _budgetController.value = const TextEditingValue(
        text: '₩',
        selection: TextSelection.collapsed(offset: 1),
      );
    }
  }

  void _saveBudgetAndStyle() {
    String text = _budgetController.text.replaceAll(RegExp(r'[^0-9]'), '').trim();
    widget.travelData.budget = double.tryParse(text) ?? 0;

    // Debugging
    print('Budget: ${widget.travelData.budget}');
    print('Styles: ${widget.travelData.styles}');
    print('Full Travel Data: ${widget.travelData}');
  }

  void _toggleStyleSelection(String style) {
    setState(() {
      if (widget.travelData.styles.contains(style)) {
        widget.travelData.removeStyle(style); // 선택 해제 시 제거
      } else {
        widget.travelData.addStyle(style); // 선택 시 추가
      }
    });
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
                  const Divider(color: Colors.white70, thickness: 1.0),
                  const SizedBox(height: 20.0),
                  const Text(
                    "당신의 여행 스타일을 알려주세요",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: travelStyles.map((style) {
                      return ChoiceChip(
                        label: Text(style),
                        labelStyle: TextStyle(
                          color: widget.travelData.styles.contains(style) ? Colors.white : Colors.white,
                        ),
                        selected: widget.travelData.styles.contains(style),
                        onSelected: (isSelected) {
                          _toggleStyleSelection(style);
                        },
                        selectedColor: Colors.blueAccent,
                        backgroundColor: Colors.grey[800],
                      );
                    }).toList(),
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
            _saveBudgetAndStyle();
            // 로딩 화면으로 이동
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoadingView(travelData: widget.travelData),
              ),
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
