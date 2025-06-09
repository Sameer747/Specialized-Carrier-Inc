import 'package:flutter/material.dart';

class ViewToggleProvider extends ChangeNotifier {
  bool _viewAll = false;

  bool get viewAll => _viewAll;

  void toggleView() {
    _viewAll = !_viewAll;
    notifyListeners();
  }
}
