import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/home_screen/models/home_model.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  TextEditingController languageOneController = TextEditingController();

  Rx<HomeModel> homeModelObj = HomeModel().obs;

  @override
  void onReady() {
    super.onReady();
    }

  @override
  void onClose() {
    super.onClose();
    languageOneController.dispose();
  }
}
