import '../controller/edit_service_page_controller.dart';
import 'package:get/get.dart';

class EditServicePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditServicePageController());
  }
}
