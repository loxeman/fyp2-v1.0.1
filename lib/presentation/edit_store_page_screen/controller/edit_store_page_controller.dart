import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/edit_store_page_screen/models/edit_store_page_model.dart';
import 'package:flutter/material.dart';

class EditStorePageController extends GetxController {
  TextEditingController priceController = TextEditingController();

  TextEditingController group2227Controller = TextEditingController();

  TextEditingController group2227OneController = TextEditingController();

  TextEditingController group2227TwoController = TextEditingController();

  TextEditingController group2227ThreeController = TextEditingController();

  Rx<EditStorePageModel> editStorePageModelObj = EditStorePageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    priceController.dispose();
    group2227Controller.dispose();
    group2227OneController.dispose();
    group2227TwoController.dispose();
    group2227ThreeController.dispose();
  }
}
