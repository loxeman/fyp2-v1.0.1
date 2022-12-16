import '../controller/sign_up_page_service_controller.dart';
import 'package:get/get.dart';

class SignUpPageServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpPageServiceController());
  }
}
