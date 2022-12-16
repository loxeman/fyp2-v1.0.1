import '../controller/add_service_page_controller.dart';
import 'package:get/get.dart';

class AddServicePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddServicePageController());
  }
}
