import 'controller/wallet_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

class WalletPageScreen extends GetWidget<WalletPageController> {
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
                          padding: getPadding(left: 14, top: 23, right: 14),
                          child: Text("lbl_wallet".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanBold34))),
                  CustomButton(
                      width: 339,
                      text: "msg_balance_rm_20_50".tr,
                      margin: getMargin(top: 37, right: 10),
                      shape: ButtonShape.CustomBorderLR10,
                      padding: ButtonPadding.PaddingAll27,
                      fontStyle: ButtonFontStyle.RobotoRomanBold36,
                      alignment: Alignment.centerLeft),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(
                              left: 14, top: 68, right: 14),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomButton(
                                    width: 150,
                                    text: "lbl_top_up".tr,
                                    variant: ButtonVariant.FillLightgreen800,
                                    shape: ButtonShape.RoundedBorder1),
                                CustomButton(
                                    width: 150,
                                    text: "lbl_withdraw".tr,
                                    margin: getMargin(left: 9))
                              ])))
                ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
