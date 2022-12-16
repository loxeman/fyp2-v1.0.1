import 'controller/edit_store_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/core/utils/validation_functions.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditStorePageScreen extends GetWidget<EditStorePageController> {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: SingleChildScrollView(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                    svgPath: ImageConstant
                                                        .imgArrowleft,
                                                    height: getSize(24.00),
                                                    width: getSize(24.00))))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 14, top: 23, right: 14),
                                            child: Text("lbl_edit_store2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold34))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 14, top: 7, right: 14),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  CommonImageView(
                                                      imagePath: ImageConstant
                                                          .imgInsertpictureicon135x136,
                                                      height: getVerticalSize(
                                                          85.00),
                                                      width: getHorizontalSize(
                                                          80.00)),
                                                  CustomTextFormField(
                                                      width: 210,
                                                      focusNode: FocusNode(),
                                                      controller: controller
                                                          .priceController,
                                                      hintText:
                                                          "lbl_change_picture"
                                                              .tr,
                                                      margin: getMargin(
                                                          top: 19, bottom: 19),
                                                      variant:
                                                          TextFormFieldVariant
                                                              .FillIndigoA700,
                                                      shape: TextFormFieldShape
                                                          .RoundedBorder20,
                                                      padding:
                                                          TextFormFieldPadding
                                                              .PaddingAll13,
                                                      fontStyle:
                                                          TextFormFieldFontStyle
                                                              .RobotoRomanRegular16)
                                                ]))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 14, top: 6, right: 14),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  CommonImageView(
                                                      imagePath: ImageConstant
                                                          .imgInsertpictureicon135x136,
                                                      height: getVerticalSize(
                                                          85.00),
                                                      width: getHorizontalSize(
                                                          80.00)),
                                                  CustomButton(
                                                      width: 211,
                                                      text:
                                                          "msg_change_cover_picture"
                                                              .tr,
                                                      margin: getMargin(
                                                          top: 19, bottom: 19),
                                                      shape: ButtonShape
                                                          .RoundedBorder20,
                                                      padding: ButtonPadding
                                                          .PaddingAll12,
                                                      fontStyle: ButtonFontStyle
                                                          .RobotoRomanRegular16)
                                                ]))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            width: double.infinity,
                                            margin: getMargin(
                                                left: 14, top: 13, right: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            8.00))),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 1, right: 10),
                                                      child: Text(
                                                          "lbl_store_name".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanMedium12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      0.12))),
                                                  CustomTextFormField(
                                                      width: 319,
                                                      focusNode: FocusNode(),
                                                      controller: controller
                                                          .group2227Controller,
                                                      hintText:
                                                          "lbl_store_name".tr,
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
                                            margin: getMargin(
                                                left: 14, top: 7, right: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            8.00))),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 1, right: 10),
                                                      child: Text(
                                                          "lbl_address".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanMedium12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      0.12))),
                                                  CustomTextFormField(
                                                      width: 320,
                                                      focusNode: FocusNode(),
                                                      controller: controller
                                                          .group2227OneController,
                                                      hintText:
                                                          "lbl_address".tr,
                                                      margin: getMargin(top: 5))
                                                ]))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            width: double.infinity,
                                            margin: getMargin(
                                                left: 14, top: 9, right: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            8.00))),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 1, right: 10),
                                                      child: Text(
                                                          "lbl_phone_number".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanMedium12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      0.12))),
                                                  CustomTextFormField(
                                                      width: 320,
                                                      focusNode: FocusNode(),
                                                      controller: controller
                                                          .group2227TwoController,
                                                      hintText:
                                                          "lbl_phone_number".tr,
                                                      margin: getMargin(top: 5),
                                                      validator: (value) {
                                                        if (!isValidPhone(
                                                            value)) {
                                                          return "Please enter valid phone number";
                                                        }
                                                        return null;
                                                      })
                                                ]))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 28, top: 8, right: 28),
                                            child: Text("lbl_operation_time".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanMedium12
                                                    .copyWith(
                                                        letterSpacing: 0.12)))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 14, top: 4, right: 14),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  CustomButton(
                                                      width: 153,
                                                      text:
                                                          "msg_select_open_time"
                                                              .tr,
                                                      variant: ButtonVariant
                                                          .FillWhiteA700,
                                                      shape: ButtonShape
                                                          .RoundedBorder6,
                                                      padding: ButtonPadding
                                                          .PaddingAll7,
                                                      fontStyle: ButtonFontStyle
                                                          .PoppinsMedium16,
                                                      suffixWidget: Container(
                                                          margin: getMargin(
                                                              left: 16),
                                                          child: CommonImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowdown16x19))),
                                                  CustomButton(
                                                      width: 153,
                                                      text:
                                                          "msg_select_close_time"
                                                              .tr,
                                                      margin:
                                                          getMargin(left: 12),
                                                      variant: ButtonVariant
                                                          .FillWhiteA700,
                                                      shape: ButtonShape
                                                          .RoundedBorder6,
                                                      padding: ButtonPadding
                                                          .PaddingAll7,
                                                      fontStyle: ButtonFontStyle
                                                          .PoppinsMedium16,
                                                      suffixWidget: Container(
                                                          margin: getMargin(
                                                              left: 14),
                                                          child: CommonImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowdown16x19)))
                                                ]))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 28, top: 8, right: 28),
                                            child: Text("lbl_operation_day".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanMedium12
                                                    .copyWith(
                                                        letterSpacing: 0.12)))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 14, top: 3, right: 14),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                      decoration: AppDecoration
                                                          .fillWhiteA700
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .circleBorder9),
                                                      child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        85.00),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            17,
                                                                        top: 10,
                                                                        bottom:
                                                                            3),
                                                                child: Text(
                                                                    "msg_select_first_day"
                                                                        .tr,
                                                                    maxLines:
                                                                        null,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: AppStyle
                                                                        .txtPoppinsMedium16
                                                                        .copyWith(
                                                                            letterSpacing:
                                                                                0.16))),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 14,
                                                                        right:
                                                                            10,
                                                                        bottom:
                                                                            16),
                                                                child: CommonImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdown16x19,
                                                                    height:
                                                                        getVerticalSize(
                                                                            16.00),
                                                                    width: getHorizontalSize(
                                                                        19.00)))
                                                          ])),
                                                  Container(
                                                      margin:
                                                          getMargin(left: 12),
                                                      decoration: AppDecoration
                                                          .fillWhiteA700
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .circleBorder9),
                                                      child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            17,
                                                                        top: 11,
                                                                        bottom:
                                                                            3),
                                                                child: Text(
                                                                    "lbl_select_last_day"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsMedium16
                                                                        .copyWith(
                                                                            letterSpacing:
                                                                                0.16))),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            21,
                                                                        top: 14,
                                                                        right:
                                                                            10,
                                                                        bottom:
                                                                            16),
                                                                child: CommonImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdown16x19,
                                                                    height:
                                                                        getVerticalSize(
                                                                            16.00),
                                                                    width: getHorizontalSize(
                                                                        19.00)))
                                                          ]))
                                                ]))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            width: double.infinity,
                                            margin: getMargin(
                                                left: 14, top: 13, right: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            8.00))),
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
                                                      child: Container(
                                                          decoration: AppDecoration
                                                              .fillWhiteA700
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder9),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left:
                                                                            12,
                                                                        top: 17,
                                                                        bottom:
                                                                            1),
                                                                    child: Text(
                                                                        "msg_automatic_online"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtPoppinsMedium16
                                                                            .copyWith(letterSpacing: 0.16))),
                                                                Container(
                                                                    margin: getMargin(
                                                                        top: 15,
                                                                        right:
                                                                            7,
                                                                        bottom:
                                                                            14),
                                                                    decoration: AppDecoration
                                                                        .fillLightgreen800
                                                                        .copyWith(
                                                                            borderRadius: BorderRadiusStyle
                                                                                .circleBorder9),
                                                                    child: Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Padding(
                                                                              padding: getPadding(left: 3, top: 2, bottom: 1),
                                                                              child: Text("lbl_on".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular12)),
                                                                          Container(
                                                                              height: getVerticalSize(14.00),
                                                                              width: getHorizontalSize(13.00),
                                                                              margin: getMargin(left: 4, top: 2, right: 1, bottom: 2),
                                                                              decoration: BoxDecoration(color: ColorConstant.whiteA700, borderRadius: BorderRadius.circular(getHorizontalSize(7.00))))
                                                                        ]))
                                                              ])))
                                                ]))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            width: double.infinity,
                                            margin: getMargin(
                                                left: 14, top: 10, right: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            8.00))),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 1, right: 10),
                                                      child: Text(
                                                          "msg_store_description"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanMedium12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      0.12))),
                                                  CustomTextFormField(
                                                      width: 320,
                                                      focusNode: FocusNode(),
                                                      controller: controller
                                                          .group2227ThreeController,
                                                      hintText:
                                                          "msg_store_description"
                                                              .tr,
                                                      margin: getMargin(top: 4),
                                                      padding:
                                                          TextFormFieldPadding
                                                              .PaddingAll13,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      maxLines: 4)
                                                ]))),
                                    CustomButton(
                                        width: 163,
                                        text: "lbl_update".tr,
                                        margin: getMargin(
                                            left: 14,
                                            top: 22,
                                            right: 14,
                                            bottom: 5),
                                        shape: ButtonShape.RoundedBorder20,
                                        padding: ButtonPadding.PaddingAll12,
                                        fontStyle: ButtonFontStyle
                                            .RobotoRomanRegular16,
                                        alignment: Alignment.center)
                                  ]))))
                    ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
