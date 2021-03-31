import 'package:flutter/material.dart';

class BPM{
  int bpm = 20;
  BPM({@required this.bpm});

  get value{
    return bpm.toString();
  }
}

class Time{
  int time = 40;
  Time({@required this.time});
}
class Kcal{
  int kcal = 2292;
  Kcal({@required this.kcal});
}

class Step{
  int steps = 15323;
  Step({@required this.steps});
}

