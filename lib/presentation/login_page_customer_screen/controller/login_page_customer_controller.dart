import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/login_page_customer_screen/models/login_page_customer_model.dart';
import 'package:flutter/material.dart';

class LoginPageCustomerController extends GetxController {
  TextEditingController textFieldOrdinaryInactiveController =
      TextEditingController();

  TextEditingController textFieldOrdinaryInactiveOneController =
      TextEditingController();

  Rx<LoginPageCustomerModel> loginPageCustomerModelObj =
      LoginPageCustomerModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textFieldOrdinaryInactiveController.dispose();
    textFieldOrdinaryInactiveOneController.dispose();
  }
}
