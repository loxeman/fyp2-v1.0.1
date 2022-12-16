import 'controller/change_password_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/core/utils/validation_functions.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordPageScreen extends GetWidget<ChangePasswordPageController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
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
                              padding: getPadding(left: 14, top: 26, right: 14),
                              child: Text("lbl_change_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanBold34))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 28, top: 14, right: 28),
                              child: Text("msg_current_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium12
                                      .copyWith(letterSpacing: 0.12)))),
                      CustomTextFormField(
                          width: 319,
                          focusNode: FocusNode(),
                          controller: controller.group2227Controller,
                          hintText: "msg_current_password".tr,
                          margin: getMargin(left: 14, top: 5, right: 14),
                          alignment: Alignment.center,
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                          isObscureText: true),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 27, top: 7, right: 27),
                              child: Text("lbl_new_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium12
                                      .copyWith(letterSpacing: 0.12)))),
                      CustomTextFormField(
                          width: 320,
                          focusNode: FocusNode(),
                          controller: controller.group2227OneController,
                          hintText: "lbl_new_password".tr,
                          margin: getMargin(left: 14, top: 5, right: 14),
                          alignment: Alignment.center,
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                          isObscureText: true),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: double.infinity,
                              margin: getMargin(left: 14, top: 9, right: 14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(8.00))),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(left: 1, right: 10),
                                        child: Text("lbl_new_password".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanMedium12
                                                .copyWith(
                                                    letterSpacing: 0.12))),
                                    CustomTextFormField(
                                        width: 320,
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.group2227TwoController,
                                        hintText: "lbl_new_password".tr,
                                        margin: getMargin(top: 5),
                                        textInputAction: TextInputAction.done,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidPassword(value,
                                                  isRequired: true))) {
                                            return "Please enter valid password";
                                          }
                                          return null;
                                        },
                                        isObscureText: true)
                                  ]))),
                      CustomButton(
                          width: 163,
                          text: "lbl_update".tr,
                          margin: getMargin(
                              left: 14, top: 293, right: 14, bottom: 5),
                          shape: ButtonShape.RoundedBorder20,
                          padding: ButtonPadding.PaddingAll12,
                          fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                          alignment: Alignment.center)
                    ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
