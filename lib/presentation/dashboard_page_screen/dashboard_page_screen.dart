import '../dashboard_page_screen/widgets/dashboard_page_item_widget.dart';
import 'controller/dashboard_page_controller.dart';
import 'models/dashboard_page_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

class DashboardPageScreen extends GetWidget<DashboardPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: SingleChildScrollView(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 8, top: 9, right: 10),
                                        child: InkWell(
                                            onTap: () {
                                              onTapImgArrowleft();
                                            },
                                            child: CommonImageView(
                                                svgPath:
                                                    ImageConstant.imgArrowleft,
                                                height: getSize(24.00),
                                                width: getSize(24.00))))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 14, top: 23, right: 14),
                                        child: Text("lbl_dashboard".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanBold34))),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 14, top: 24, right: 14),
                                        child: Obx(() => GridView.builder(
                                            shrinkWrap: true,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisExtent: getVerticalSize(
                                                        186.00),
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing:
                                                        getHorizontalSize(
                                                            19.26),
                                                    crossAxisSpacing:
                                                        getHorizontalSize(
                                                            19.26)),
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: controller
                                                .dashboardPageModelObj
                                                .value
                                                .dashboardPageItemList
                                                .length,
                                            itemBuilder: (context, index) {
                                              DashboardPageItemModel model =
                                                  controller
                                                          .dashboardPageModelObj
                                                          .value
                                                          .dashboardPageItemList[
                                                      index];
                                              return DashboardPageItemWidget(
                                                  model);
                                            })))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        width: getHorizontalSize(150.00),
                                        margin: getMargin(
                                            left: 28, top: 23, right: 28),
                                        decoration: AppDecoration.fillWhiteA700
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder6),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: CommonImageView(
                                                      imagePath: ImageConstant
                                                          .imgInsertpictureicon135x136,
                                                      height: getVerticalSize(
                                                          151.00),
                                                      width: getHorizontalSize(
                                                          150.00))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 54,
                                                      top: 7,
                                                      right: 53,
                                                      bottom: 8),
                                                  child: Text("lbl_wallet".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtRobotoRomanRegular15))
                                            ]))),
                                CustomButton(
                                    width: 200,
                                    text: "lbl_log_out".tr,
                                    margin: getMargin(
                                        left: 14,
                                        top: 29,
                                        right: 14,
                                        bottom: 5),
                                    variant: ButtonVariant.FillRed900,
                                    alignment: Alignment.center)
                              ]))))
                ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
