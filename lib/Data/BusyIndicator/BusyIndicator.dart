import 'package:flutter/material.dart';

class BusyIndicator extends ChangeNotifier {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  void setIsBusyNoNotify(bool value) {
    _isBusy = value;
  }
  
  void setIsBusy(bool value) {
    setIsBusyNoNotify(value);
    notifyListeners();
  }
}