import '../controller/splashscreen_page_controller.dart';
import 'package:get/get.dart';

class SplashscreenPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashscreenPageController());
  }
}
