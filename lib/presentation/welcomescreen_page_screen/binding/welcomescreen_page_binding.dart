import '../controller/welcomescreen_page_controller.dart';
import 'package:get/get.dart';

class WelcomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomePageController());
  }
}
