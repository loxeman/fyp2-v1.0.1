import 'package:fyp2/presentation/navbar/Controller/navbar_controller.dart';
import 'package:get/get.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
  }
}