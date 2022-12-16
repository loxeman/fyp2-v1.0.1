import '../controller/wallet_page_controller.dart';
import 'package:get/get.dart';

class WalletPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletPageController());
  }
}
