import 'controller/edit_service_page_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/core/utils/validation_functions.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditServicePageOneScreen extends StatefulWidget {
final dynamic services;
const EditServicePageOneScreen({Key? key, required this.services}) : super(key: key);

@override
State<EditServicePageOneScreen> createState() => _EditStorePageScreen();
}

class _EditStorePageScreen extends State<EditServicePageOneScreen> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller=Get.put(EditServicePageOneController());

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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              child: Text("lbl_edit_service".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanBold34))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: getPadding(left: 10, top: 7),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: getHorizontalSize(349.00),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    CommonImageView(
                                                        imagePath: ImageConstant
                                                            .imgInsertpictureicon135x136,
                                                        height: getVerticalSize(
                                                            85.00),
                                                        width:
                                                            getHorizontalSize(
                                                                82.00)),
                                                    CommonImageView(
                                                        imagePath: ImageConstant
                                                            .imgInsertpictureicon135x136,
                                                        height: getVerticalSize(
                                                            85.00),
                                                        width:
                                                            getHorizontalSize(
                                                                82.00)),
                                                    CommonImageView(
                                                        imagePath: ImageConstant
                                                            .imgInsertpictureicon135x136,
                                                        height: getVerticalSize(
                                                            85.00),
                                                        width:
                                                            getHorizontalSize(
                                                                82.00)),
                                                    CommonImageView(
                                                        imagePath: ImageConstant
                                                            .imgInsertpictureicon85x82,
                                                        height: getVerticalSize(
                                                            85.00),
                                                        width:
                                                            getHorizontalSize(
                                                                82.00))
                                                  ])),
                                          Padding(
                                              padding: getPadding(
                                                  left: 3, top: 8, right: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    CustomButton(
                                                        width: 150,
                                                        text: "lbl_add_picture"
                                                            .tr,
                                                        shape: ButtonShape
                                                            .RoundedBorder20,
                                                        padding: ButtonPadding
                                                            .PaddingAll12,
                                                        fontStyle: ButtonFontStyle
                                                            .RobotoRomanRegular16),
                                                    CustomButton(
                                                        width: 150,
                                                        text:
                                                            "lbl_remove_picture"
                                                                .tr,
                                                        margin:
                                                            getMargin(left: 10),
                                                        variant: ButtonVariant
                                                            .FillRed900,
                                                        shape: ButtonShape
                                                            .RoundedBorder20,
                                                        padding: ButtonPadding
                                                            .PaddingAll12,
                                                        fontStyle: ButtonFontStyle
                                                            .RobotoRomanRegular16)
                                                  ]))
                                        ]),
                                    Padding(
                                        padding:
                                            getPadding(left: 8, bottom: 55),
                                        child: CommonImageView(
                                            imagePath: ImageConstant
                                                .imgInsertpictureicon85x86,
                                            height: getVerticalSize(85.00),
                                            width: getHorizontalSize(86.00)))
                                  ]))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 29, top: 11, right: 29),
                              child: Text("lbl_service_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium12
                                      .copyWith(letterSpacing: 0.12)))),
                      CustomTextFormField(
                          width: 319,
                          focusNode: FocusNode(),
                          controller: controller.group2227Controller,
                          hintText: "lbl_service_name".tr,
                          margin: getMargin(left: 10, top: 5, right: 10),
                          padding: TextFormFieldPadding.PaddingAll13,
                          alignment: Alignment.center,
                          validator: (value) {
                            if (!isText(value)) {
                              return "Please enter valid text";
                            }
                            return null;
                          }),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: double.infinity,
                              margin: getMargin(left: 10, top: 9, right: 10),
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
                                        child: Text("lbl_booking_price2".tr,
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
                                        hintText: "lbl_booking_price2".tr,
                                        margin: getMargin(top: 4))
                                  ]))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: double.infinity,
                              margin: getMargin(left: 10, top: 7, right: 10),
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
                                        child: Text("lbl_estimated_time".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanMedium12
                                                .copyWith(
                                                    letterSpacing: 0.12))),
                                    Container(
                                        margin: getMargin(top: 5),
                                        decoration: AppDecoration.fillWhiteA700
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder9),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 8,
                                                      top: 11,
                                                      bottom: 11),
                                                  child: Text(
                                                      "msg_select_estimated".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsMedium16
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.16))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 18,
                                                      top: 15,
                                                      bottom: 16),
                                                  child: CommonImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowdown16x19,
                                                      height: getVerticalSize(
                                                          16.00),
                                                      width: getHorizontalSize(
                                                          22.00)))
                                            ]))
                                  ]))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: double.infinity,
                              margin: getMargin(left: 10, top: 9, right: 10),
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
                                        child: Text(
                                            "msg_service_description2".tr,
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
                                        hintText: "msg_store_description".tr,
                                        margin: getMargin(top: 4),
                                        padding:
                                            TextFormFieldPadding.PaddingAll13,
                                        textInputAction: TextInputAction.done,
                                        maxLines: 4)
                                  ]))),
                      CustomButton(
                          width: 163,
                          text: "lbl_update".tr,
                          margin: getMargin(
                              left: 10, top: 24, right: 10, bottom: 5),
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
