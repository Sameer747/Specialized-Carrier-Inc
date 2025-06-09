// import 'package:flutter/material.dart';

// class MonthYearProvider extends ChangeNotifier {
//   int selectedMonth = DateTime.now().month;
//   int selectedYear = DateTime.now().year;

//   void updateMonth(int month) {
//     selectedMonth = month;
//     notifyListeners();
//   }

//   void updateYear(int year) {
//     selectedYear = year;
//     notifyListeners();
//   }

//   String get formatted => "${_monthName(selectedMonth)} $selectedYear";

//   String _monthName(int m) => [
//     '',
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December',
//   ][m];
// }

import 'package:flutter/material.dart';

class MonthYearProvider extends ChangeNotifier {
  int? selectedMonth; // <-- Make nullable
  int selectedYear = DateTime.now().year;

  void updateMonth(int? month) {
    // <-- Accept nullable
    selectedMonth = month;
    notifyListeners();
  }

  void updateYear(int year) {
    selectedYear = year;
    notifyListeners();
  }

  String get formatted {
    if (selectedMonth == null) return "All $selectedYear";
    return "${_monthName(selectedMonth!)} $selectedYear";
  }

  String _monthName(int m) => [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ][m];
}
