import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/sign_up_page_service_screen/models/sign_up_page_service_model.dart';
import 'package:flutter/material.dart';

class SignUpPageServiceController extends GetxController {
  TextEditingController textFieldOrdinaryInactiveController =
      TextEditingController();

  TextEditingController textFieldOrdinaryInactiveOneController =
      TextEditingController();

  TextEditingController textFieldOrdinaryInactiveTwoController =
      TextEditingController();

  TextEditingController textFieldOrdinaryInactiveThreeController =
      TextEditingController();

  Rx<SignUpPageServiceModel> signUpPageServiceModelObj =
      SignUpPageServiceModel().obs;

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
