import 'package:flutter/material.dart';

class BusyIndicator extends ChangeNotifier {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  void setIsBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }
}