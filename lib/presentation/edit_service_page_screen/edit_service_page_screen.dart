import 'controller/edit_service_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

class EditServicePageScreen extends GetWidget<EditServicePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 8, top: 9, right: 10),
                          child: InkWell(
                              onTap: () {
                                onTapImgArrowleft();
                              },
                              child: CommonImageView(
                                  svgPath: ImageConstant.imgArrowleft,
                                  height: getSize(24.00),
                                  width: getSize(24.00))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 14, top: 27, right: 14),
                          child: Text("lbl_manage_services".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanBold34))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 14, top: 28, right: 14),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
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
                                              alignment: Alignment.centerLeft,
                                              child: CommonImageView(
                                                  imagePath: ImageConstant
                                                      .imgInsertpictureicon135x136,
                                                  height:
                                                      getVerticalSize(151.00),
                                                  width: getHorizontalSize(
                                                      150.00))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 44,
                                                  top: 7,
                                                  right: 44,
                                                  bottom: 8),
                                              child: Text("lbl_service_1".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular15))
                                        ])),
                                Container(
                                    margin: getMargin(left: 19),
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
                                              alignment: Alignment.centerLeft,
                                              child: CommonImageView(
                                                  imagePath: ImageConstant
                                                      .imgInsertpictureicon135x136,
                                                  height:
                                                      getVerticalSize(151.00),
                                                  width: getHorizontalSize(
                                                      150.00))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 44,
                                                  top: 7,
                                                  right: 44,
                                                  bottom: 8),
                                              child: Text("lbl_service_2".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular15))
                                        ]))
                              ]))),
                  CustomButton(
                      width: 135,
                      text: "lbl_add_service".tr,
                      margin:
                          getMargin(left: 13, top: 344, right: 13, bottom: 5),
                      shape: ButtonShape.RoundedBorder20,
                      padding: ButtonPadding.PaddingAll12,
                      fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                      alignment: Alignment.centerRight)
                ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
