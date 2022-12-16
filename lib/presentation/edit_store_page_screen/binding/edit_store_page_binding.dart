import '../controller/edit_store_page_controller.dart';
import 'package:get/get.dart';

class EditStorePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditStorePageController());
  }
}
