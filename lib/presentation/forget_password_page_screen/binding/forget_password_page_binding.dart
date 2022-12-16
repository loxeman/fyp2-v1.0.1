import '../controller/forget_password_page_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordPageController());
  }
}
