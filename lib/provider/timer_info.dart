
import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:flutter/material.dart';

int min = 3;
int max = 6;
Random random = new Random();

class TimerInfo extends ChangeNotifier {
  int _remainingTime = min + random.nextInt(max - min);
  int getRemainingTime() => _remainingTime;

  updateRemainingTime() {
      _remainingTime>=0?_remainingTime-- :destroyRemainingTime();
      notifyListeners();
  }

  destroyRemainingTime() {
    _remainingTime=0 ;
    notifyListeners();
  }

}
