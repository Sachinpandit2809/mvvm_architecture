import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resources/app_color.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  bool loading = false;
  RoundButton({super.key, required this.title, loading, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
            decoration: BoxDecoration(
                color: AppColor.yellow,
                borderRadius: BorderRadius.circular(12)),
            height: 40,
            width: 150,
            child: Center(child: Text(title))));
  }
}
