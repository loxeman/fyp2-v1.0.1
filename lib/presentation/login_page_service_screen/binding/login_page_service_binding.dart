import '../controller/login_page_service_controller.dart';
import 'package:get/get.dart';

class LoginPageServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageServiceController());
  }
}
