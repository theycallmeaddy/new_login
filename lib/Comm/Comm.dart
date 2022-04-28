import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

alertDialog(BuildContext context, String msg) {
  Fluttertoast.showToast(msg: msg,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG
  );
  // Toast.show(msg, duration: Toast.lengthLong, gravity:  Toast.bottom);
}

validateEmail(String email) {
  final emailReg = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}