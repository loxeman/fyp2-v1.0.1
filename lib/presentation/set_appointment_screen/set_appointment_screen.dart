import '../set_appointment_screen/widgets/listtime_item_widget.dart';
import 'controller/set_appointment_controller.dart';
import 'models/listtime_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/core/utils/validation_functions.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SetAppointmentScreen extends GetWidget<SetAppointmentController> {
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
                              child: Text("lbl_set_appointment".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanBold34))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 29, top: 14, right: 29),
                              child: Text("lbl_service_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium12
                                      .copyWith(letterSpacing: 0.12)))),
                      CustomTextFormField(
                          width: 313,
                          focusNode: FocusNode(),
                          controller: controller.group2227Controller,
                          hintText: "lbl_service_name".tr,
                          margin: getMargin(left: 14, top: 5, right: 14),
                          variant: TextFormFieldVariant.FillGray300,
                          padding: TextFormFieldPadding.PaddingAll13,
                          alignment: Alignment.center,
                          validator: (value) {
                            if (!isText(value)) {
                              return "Please enter valid text";
                            }
                            return null;
                          }),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 28, top: 7, right: 28),
                              child: Text("msg_service_provider".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium12
                                      .copyWith(letterSpacing: 0.12)))),
                      CustomTextFormField(
                          width: 314,
                          focusNode: FocusNode(),
                          controller: controller.group2227OneController,
                          hintText: "msg_service_provider2".tr,
                          margin: getMargin(left: 14, top: 5, right: 14),
                          variant: TextFormFieldVariant.FillGray300,
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
                          child: Padding(
                              padding: getPadding(left: 14, top: 10, right: 14),
                              child: Obx(() => ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.setAppointmentModelObj
                                      .value.listtimeItemList.length,
                                  itemBuilder: (context, index) {
                                    ListtimeItemModel model = controller
                                        .setAppointmentModelObj
                                        .value
                                        .listtimeItemList[index];
                                    return ListtimeItemWidget(model);
                                  })))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 28, top: 19, right: 28),
                              child: Text("lbl_meeting_option".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium12
                                      .copyWith(letterSpacing: 0.12)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 30, top: 4, right: 30),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        height: getVerticalSize(21.00),
                                        width: getHorizontalSize(19.00),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.indigoA700,
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(10.00)))),
                                    Padding(
                                        padding: getPadding(
                                            left: 9, top: 3, bottom: 2),
                                        child: Text("lbl_home_service".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanMedium12
                                                .copyWith(letterSpacing: 0.12)))
                                  ]))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 30, top: 8, right: 30),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        height: getVerticalSize(21.00),
                                        width: getHorizontalSize(19.00),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray100,
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(10.00)))),
                                    Padding(
                                        padding: getPadding(
                                            left: 9, top: 3, bottom: 2),
                                        child: Text("lbl_store_walk_in".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanMedium12
                                                .copyWith(letterSpacing: 0.12)))
                                  ]))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 28, top: 19, right: 28),
                              child: Text("msg_meeting_location".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium12
                                      .copyWith(letterSpacing: 0.12)))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(47.00),
                              width: getHorizontalSize(320.00),
                              margin: getMargin(left: 14, top: 4, right: 14),
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 10, top: 11, bottom: 11),
                                        child: CommonImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightBluegray200,
                                            height: getVerticalSize(24.00),
                                            width: getHorizontalSize(21.00)))),
                                CustomTextFormField(
                                    width: 314,
                                    focusNode: FocusNode(),
                                    controller:
                                        controller.group2227TwoController,
                                    hintText: "lbl_choose_location".tr,
                                    margin: getMargin(right: 5),
                                    padding: TextFormFieldPadding.PaddingAll13,
                                    textInputAction: TextInputAction.done,
                                    alignment: Alignment.center)
                              ]))),
                      CustomButton(
                          width: 163,
                          text: "lbl_proceed".tr,
                          margin: getMargin(
                              left: 14, top: 37, right: 14, bottom: 5),
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
