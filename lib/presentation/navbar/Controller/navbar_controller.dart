import 'package:fyp2/presentation/navbar/models/navbar_model.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  Rx<NavbarModel> myProfileModelObj = NavbarModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}