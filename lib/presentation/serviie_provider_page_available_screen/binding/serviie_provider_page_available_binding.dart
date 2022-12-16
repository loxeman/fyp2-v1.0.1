import '../controller/serviie_provider_page_available_controller.dart';
import 'package:get/get.dart';

class ServiieProviderPageAvailableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiieProviderPageAvailableController());
  }
}
