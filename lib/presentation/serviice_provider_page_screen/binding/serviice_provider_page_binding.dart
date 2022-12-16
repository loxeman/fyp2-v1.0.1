import '../controller/serviice_provider_page_controller.dart';
import 'package:get/get.dart';

class ServiiceProviderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiiceProviderPageController());
  }
}
