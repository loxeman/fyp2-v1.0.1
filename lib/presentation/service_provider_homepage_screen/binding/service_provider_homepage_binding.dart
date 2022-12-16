import '../controller/service_provider_homepage_controller.dart';
import 'package:get/get.dart';

class ServiceProviderHomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceProviderHomepageController());
  }
}
