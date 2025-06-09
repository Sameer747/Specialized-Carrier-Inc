import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String name = "John Doe";
  final String id = "458799"; // Fixed; not editable
  String phone = "(0) 955 55 765";
  String email = "johndoe@gmail.com";
  String password = "password123";

  void updateName(String val) {
    name = val;
    notifyListeners();
  }

  void updatePhone(String val) {
    phone = val;
    notifyListeners();
  }

  void updateEmail(String val) {
    email = val;
    notifyListeners();
  }

  void updatePassword(String val) {
    password = val;
    notifyListeners();
  }
}
