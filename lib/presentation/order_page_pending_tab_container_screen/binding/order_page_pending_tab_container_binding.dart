import '../controller/order_page_pending_tab_container_controller.dart';
import 'package:get/get.dart';

class OrderPagePendingTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderPagePendingTabContainerController());
  }
}
