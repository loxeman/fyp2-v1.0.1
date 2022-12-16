import '../controller/serviice_provider_page_available_controller.dart';
import 'package:get/get.dart';

class ServiiceProviderPageAvailableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiiceProviderPageAvailableController());
  }
}
