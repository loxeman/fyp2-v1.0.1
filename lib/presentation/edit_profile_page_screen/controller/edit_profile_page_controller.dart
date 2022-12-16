import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/edit_profile_page_screen/models/edit_profile_page_model.dart';
import 'package:flutter/material.dart';

class EditProfilePageController extends GetxController {
  TextEditingController group2227Controller = TextEditingController();

  TextEditingController group2227OneController = TextEditingController();

  TextEditingController group2227TwoController = TextEditingController();

  Rx<EditProfilePageModel> editProfilePageModelObj = EditProfilePageModel().obs;

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
