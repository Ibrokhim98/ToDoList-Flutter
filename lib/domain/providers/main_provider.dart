import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }

  void setIndex(int index) {
    _index = index;
  }
}
