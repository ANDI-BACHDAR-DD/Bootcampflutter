import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Info {
  static error(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      backgroundColor: Colors.red,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static success(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      backgroundColor: Colors.green,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static netral(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
