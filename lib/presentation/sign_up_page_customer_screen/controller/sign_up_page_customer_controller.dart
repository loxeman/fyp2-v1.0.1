import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/sign_up_page_customer_screen/models/sign_up_page_customer_model.dart';
import 'package:flutter/material.dart';

class SignUpPageCustomerController extends GetxController {
  TextEditingController textFieldOrdinaryInactiveController =
      TextEditingController();

  TextEditingController textFieldOrdinaryInactiveOneController =
      TextEditingController();

  TextEditingController textFieldOrdinaryInactiveTwoController =
      TextEditingController();

  TextEditingController textFieldOrdinaryInactiveThreeController =
      TextEditingController();

  Rx<SignUpPageCustomerModel> signUpPageCustomerModelObj =
      SignUpPageCustomerModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textFieldOrdinaryInactiveController.dispose();
    textFieldOrdinaryInactiveOneController.dispose();
    textFieldOrdinaryInactiveTwoController.dispose();
    textFieldOrdinaryInactiveThreeController.dispose();
  }
}
