import 'package:flutter/material.dart';

enum ScreenType { dashboard, totalEntries, addUser, userList, settings }

class NavigationProvider with ChangeNotifier {
  ScreenType _currentScreen = ScreenType.dashboard;

  ScreenType get currentScreen => _currentScreen;

  void changeScreen(ScreenType screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
