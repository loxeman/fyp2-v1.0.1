import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/service_provider_homepage_screen/models/service_provider_homepage_model.dart';
import 'package:flutter/material.dart';

class ServiceProviderHomepageController extends GetxController {
  TextEditingController timeController = TextEditingController();

  Rx<ServiceProviderHomepageModel> serviceProviderHomepageModelObj =
      ServiceProviderHomepageModel().obs;

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
