import '../controller/serviice_provider_page_not_available_controller.dart';
import 'package:get/get.dart';

class ServiiceProviderPageNotAvailableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiiceProviderPageNotAvailableController());
  }
}
