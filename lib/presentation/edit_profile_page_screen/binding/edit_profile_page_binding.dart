import '../controller/edit_profile_page_controller.dart';
import 'package:get/get.dart';

class EditProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfilePageController());
  }
}
