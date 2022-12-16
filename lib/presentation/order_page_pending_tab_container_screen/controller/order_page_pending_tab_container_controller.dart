import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/order_page_pending_tab_container_screen/models/order_page_pending_tab_container_model.dart';
import 'package:flutter/material.dart';

class OrderPagePendingTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<OrderPagePendingTabContainerModel> orderPagePendingTabContainerModelObj =
      OrderPagePendingTabContainerModel().obs;

  late TabController group13Controller =
      Get.put(TabController(vsync: this, length: 3));

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
