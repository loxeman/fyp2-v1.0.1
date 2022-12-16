import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/order_page/models/order_model.dart';

class OrderController extends GetxController {
  OrderController(this.orderModelObj);

  Rx<OrderModel> orderModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
