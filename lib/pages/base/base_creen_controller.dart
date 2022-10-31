import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/alert_dialog_cart.dart';

class BaseScreenController extends GetxController {
  List cartList = [];

  showDialogCart(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogCart();
      },
    );
  }
}
