import '../controller/change_password_page_controller.dart';
import 'package:get/get.dart';

class ChangePasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordPageController());
  }
}
