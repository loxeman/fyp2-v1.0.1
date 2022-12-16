import '../controller/sign_up_page_customer_controller.dart';
import 'package:get/get.dart';

class SignUpPageCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpPageCustomerController());
  }
}
