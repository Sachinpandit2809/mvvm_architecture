import 'package:flutter/material.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/resources/app_color.dart';
import 'package:mvvm_architecture/view_model/auth_view_Model.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  bool loading;
  RoundButton(
      {super.key,
      required this.title,
      required this.loading,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
            decoration: BoxDecoration(
                color: AppColor.yellow,
                borderRadius: BorderRadius.circular(12)),
            height: 50,
            width: 180,
            child: Center(
                child: loading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(title))));
  }
}
