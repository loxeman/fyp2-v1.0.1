import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/login_page_service_screen/models/login_page_service_model.dart';
import 'package:flutter/material.dart';

class LoginPageServiceController extends GetxController {
  TextEditingController textFieldOrdinaryInactiveController =
      TextEditingController();

  TextEditingController textFieldOrdinaryInactiveOneController =
      TextEditingController();

  Rx<LoginPageServiceModel> loginPageServiceModelObj =
      LoginPageServiceModel().obs;

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
