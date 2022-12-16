import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/serviice_provider_page_screen/models/serviice_provider_page_model.dart';
import 'package:flutter/material.dart';

class ServiiceProviderPageController extends GetxController {
  TextEditingController timeController = TextEditingController();

  Rx<ServiiceProviderPageModel> serviiceProviderPageModelObj =
      ServiiceProviderPageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    timeController.dispose();
  }
}
