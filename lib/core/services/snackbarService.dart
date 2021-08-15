import 'package:asthma_management/views/signup/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SnackBarService {

  static SnackBarService instance = SnackBarService();

  set buildContext(BuildContext _context) {
  }

  void showSnackBarError(String _message) {
    Get.snackbar('Hey there!', _message,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        leftBarIndicatorColor: buttonColor,
        backgroundColor: Colors.red,
        borderRadius: 0,
        duration: Duration(seconds: 4),
        icon: Icon(Icons.error)
        // backgroundColor: buttonColor
        );
  }

  void showSnackBarSuccess(String _message) {
    Get.snackbar('Hey there!', _message,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        leftBarIndicatorColor: buttonColor,
        backgroundColor: Colors.lightGreen,
        borderRadius: 0,
        duration: Duration(seconds: 4),
        icon: Icon(Icons.check_circle)
        // backgroundColor: buttonColor
        );
  }
}
