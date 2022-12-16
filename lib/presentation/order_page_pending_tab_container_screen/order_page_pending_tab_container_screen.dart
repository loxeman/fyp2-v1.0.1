import 'controller/order_page_pending_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/job_page_pending_page/job_page_pending_page.dart';
import 'package:fyp2/presentation/order_page_pending_one_page/order_page_pending_one_page.dart';
import 'package:fyp2/widgets/app_bar/appbar_image.dart';
import 'package:fyp2/widgets/app_bar/custom_app_bar.dart';

class OrderPagePendingTabContainerScreen
    extends GetWidget<OrderPagePendingTabContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                centerTitle: true,
                title: Container(
                    margin: getMargin(top: 11.0, bottom: 11.0),
                    decoration: AppDecoration.outlineBlack90014,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AppbarImage(
                              height: getSize(24.00),
                              width: getSize(24.00),
                              svgPath: ImageConstant.imgArrowleft,
                              margin: getMargin(left: 8, top: 9, bottom: 1),
                              onTap: onTapArrowleft),
                          Padding(
                              padding:
                                  getPadding(left: 132, top: 11, right: 165),
                              child: Text("lbl_order".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanBold18WhiteA700
                                      .copyWith(height: 1.22)))
                        ])),
                styleType: Style.bgShadowBlack90014),
            body: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: getHorizontalSize(326.00),
                      margin: getMargin(left: 23, top: 26, right: 23),
                      child: TabBar(
                          controller: controller.group13Controller,
                          tabs: [
                            Tab(text: "lbl_pending".tr),
                            Tab(text: "lbl_ongoing".tr),
                            Tab(text: "lbl_completed".tr)
                          ],
                          labelColor: ColorConstant.whiteA700,
                          unselectedLabelColor: ColorConstant.whiteA700)),
                  Container(
                      margin:
                          getMargin(left: 23, top: 29, right: 23, bottom: 565),
                      height: getVerticalSize(78.00),
                      child: TabBarView(
                          controller: controller.group13Controller,
                          children: [
                            JobPagePendingPage(),
                            OrderPagePendingOnePage(),
                            OrderPagePendingOnePage()
                          ]))
                ])));
  }

  onTapArrowleft() {
    Get.back();
  }
}
