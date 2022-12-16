import '../controller/setting_page_controller.dart';
import 'package:get/get.dart';

class SettingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPageController());
  }
}
