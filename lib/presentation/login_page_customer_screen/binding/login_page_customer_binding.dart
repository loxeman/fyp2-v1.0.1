import '../controller/login_page_customer_controller.dart';
import 'package:get/get.dart';

class LoginPageCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageCustomerController());
  }
}
