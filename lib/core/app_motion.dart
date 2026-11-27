import 'package:flutter/animation.dart';

class AppMotion {
  static const fast = Duration(milliseconds: 180);
  static const normal = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 350);

  static const staggerStep = Duration(milliseconds: 120);
  static const staggerMaxIndex = 5;

  static const curve = Curves.easeOutCubic;
  static const bounce = Curves.easeOutBack;
}
