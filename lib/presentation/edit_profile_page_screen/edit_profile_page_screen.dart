import 'controller/edit_profile_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/core/utils/validation_functions.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditProfilePageScreen extends GetWidget<EditProfilePageController> {
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
                              padding: getPadding(left: 14, top: 23, right: 14),
                              child: Text("lbl_edit_profile".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanBold34))),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 14, top: 17, right: 14),
                              child: CommonImageView(
                                  imagePath: ImageConstant.imgUser2,
                                  height: getSize(148.00),
                                  width: getSize(148.00)))),
                      CustomButton(
                          width: 163,
                          text: "lbl_change_picture".tr,
                          margin: getMargin(left: 14, top: 16, right: 14),
                          shape: ButtonShape.RoundedBorder20,
                          padding: ButtonPadding.PaddingAll12,
                          fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: double.infinity,
                              margin: getMargin(left: 14, top: 19, right: 14),
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
                                        child: Text("lbl_name".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanMedium12
                                                .copyWith(
                                                    letterSpacing: 0.12))),
                                    CustomTextFormField(
                                        width: 319,
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.group2227Controller,
                                        hintText: "lbl_name".tr,
                                        margin: getMargin(top: 5),
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        })
                                  ]))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: double.infinity,
                              margin: getMargin(left: 14, top: 7, right: 14),
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
                                        child: Text("lbl_address".tr,
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
                                            controller.group2227OneController,
                                        hintText: "lbl_address".tr,
                                        margin: getMargin(top: 5))
                                  ]))),
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
                                        child: Text("lbl_phone_number".tr,
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
                                        hintText: "lbl_phone_number".tr,
                                        margin: getMargin(top: 5),
                                        textInputAction: TextInputAction.done,
                                        validator: (value) {
                                          if (!isValidPhone(value)) {
                                            return "Please enter valid phone number";
                                          }
                                          return null;
                                        })
                                  ]))),
                      CustomButton(
                          width: 163,
                          text: "lbl_update".tr,
                          margin: getMargin(
                              left: 14, top: 60, right: 14, bottom: 5),
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
