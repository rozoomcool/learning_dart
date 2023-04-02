import 'package:flutter/material.dart';

class CurrentTaskProvider extends ChangeNotifier{
  int testIndex;
  int current = 0;
  int last;

  void incrementCurrent(){
    current++;
    notifyListeners();
  }

  CurrentTaskProvider(this.last, this.testIndex);
}