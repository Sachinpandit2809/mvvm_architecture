import 'package:flutter/material.dart';

extension MQE on BuildContext {
  double get ScreenHeight => MediaQuery.sizeOf(this).height;
  double get ScreenWidth => MediaQuery.sizeOf(this).width;
}
