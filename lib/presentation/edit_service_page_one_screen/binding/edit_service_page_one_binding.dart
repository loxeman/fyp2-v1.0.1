import '../controller/edit_service_page_one_controller.dart';
import 'package:get/get.dart';

class EditServicePageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditServicePageOneController());
  }
}
