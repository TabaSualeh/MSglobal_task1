import 'package:fluttertoast/fluttertoast.dart';
import 'package:module1_msglobal/constants/colors.dart';
import 'package:flutter/material.dart';

class Controller {
  void toPrint() {
    print("Taba");
  }

  showToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: greyScaffoldbf.withOpacity(0.8),
        textColor: whiteonly,
        fontSize: 16.0);
  }
}
