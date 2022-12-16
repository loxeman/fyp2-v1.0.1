import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/edit_service_page_one_screen/models/edit_service_page_one_model.dart';
import 'package:flutter/material.dart';

class EditServicePageOneController extends GetxController {
  TextEditingController group2227Controller = TextEditingController();

  TextEditingController group2227OneController = TextEditingController();

  TextEditingController group2227TwoController = TextEditingController();

  Rx<EditServicePageOneModel> editServicePageOneModelObj =
      EditServicePageOneModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group2227Controller.dispose();
    group2227OneController.dispose();
    group2227TwoController.dispose();
  }
}
