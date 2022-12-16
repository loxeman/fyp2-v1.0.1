import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/set_appointment_screen/models/set_appointment_model.dart';
import 'package:flutter/material.dart';

class SetAppointmentController extends GetxController {
  TextEditingController group2227Controller = TextEditingController();

  TextEditingController group2227OneController = TextEditingController();

  TextEditingController group2227TwoController = TextEditingController();

  Rx<SetAppointmentModel> setAppointmentModelObj = SetAppointmentModel().obs;

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
