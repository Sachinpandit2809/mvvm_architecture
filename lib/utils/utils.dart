import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // ignore: non_constant_identifier_names
  static void FieldFocusChange(BuildContext context, FocusNode currentFocusNode,
      FocusNode nextFocusNode) {
    currentFocusNode.requestFocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          message: message,
          icon: const Icon(Icons.error),
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static showSnackbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue)),
        content: Text(message)));
  }
}
