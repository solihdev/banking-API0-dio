import 'package:banking_api_dio/ui/sample_usage.dart';
import 'package:banking_api_dio/ui/sample_usage_expenses.dart';
import 'package:flutter/material.dart';
class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const SampleUsageIncomes(),
      const SampleUsageExpenses(),
    ];
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded),
                label: 'Incomes'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Expenses'
            ),
          ],
        ),
      ),
    );
  }
}