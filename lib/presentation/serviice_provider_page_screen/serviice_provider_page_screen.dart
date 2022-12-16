import 'controller/serviice_provider_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

class ServiiceProviderPageScreen
    extends GetWidget<ServiiceProviderPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: getVerticalSize(185.00),
                          width: size.width,
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    height: getVerticalSize(185.00),
                                    width: size.width,
                                    decoration: AppDecoration.fillIndigoA700,
                                    child: Stack(children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 8,
                                                  top: 9,
                                                  right: 10,
                                                  bottom: 10),
                                              child: InkWell(
                                                  onTap: () {
                                                    onTapImgArrowleft();
                                                  },
                                                  child: CommonImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowleft,
                                                      height: getSize(24.00),
                                                      width: getSize(24.00)))))
                                    ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(
                                        left: 13,
                                        top: 10,
                                        right: 13,
                                        bottom: 10),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                              height: getVerticalSize(135.00),
                                              width: getHorizontalSize(136.00),
                                              child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Container(
                                                            height:
                                                                getVerticalSize(
                                                                    107.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    109.00),
                                                            margin: getMargin(
                                                                left: 12,
                                                                top: 10,
                                                                right: 12,
                                                                bottom: 5),
                                                            decoration: BoxDecoration(
                                                                color: ColorConstant
                                                                    .whiteA700))),
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: CommonImageView(
                                                            imagePath: ImageConstant
                                                                .imgInsertpictureicon135x136,
                                                            height:
                                                                getVerticalSize(
                                                                    135.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    136.00)))
                                                  ])),
                                          Container(
                                              width: getHorizontalSize(163.00),
                                              margin: getMargin(
                                                  left: 20,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text(
                                                  "msg_service_provider3".tr,
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold34WhiteA700))
                                        ])))
                          ]))),
                  CustomTextFormField(
                      width: 320,
                      focusNode: FocusNode(),
                      controller: controller.timeController,
                      hintText: "msg_operation_time2".tr,
                      margin: getMargin(left: 28, top: 24, right: 27),
                      shape: TextFormFieldShape.RoundedBorder4,
                      padding: TextFormFieldPadding.PaddingAll7,
                      fontStyle: TextFormFieldFontStyle.RobotoRomanRegular15,
                      textInputAction: TextInputAction.done),
                  Container(
                      width: double.infinity,
                      margin: getMargin(left: 28, top: 6, right: 27),
                      decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder6),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: getHorizontalSize(286.00),
                                    margin: getMargin(
                                        left: 8, top: 7, right: 25, bottom: 5),
                                    child: Text("msg_location_ss177".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtRobotoRomanRegular15)))
                          ])),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: getMargin(left: 28, top: 8, right: 28),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder6),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                    padding:
                                        getPadding(left: 4, top: 4, bottom: 5),
                                    child: Text("lbl_current_status".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtRobotoRomanRegular15)),
                                Container(
                                    margin:
                                        getMargin(left: 7, top: 5, bottom: 5),
                                    decoration: AppDecoration.fillLightgreen800
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder9),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 5, top: 2, bottom: 1),
                                              child: Text("lbl_online".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular12)),
                                          Container(
                                              height: getSize(14.00),
                                              width: getSize(14.00),
                                              margin: getMargin(
                                                  left: 3,
                                                  top: 2,
                                                  right: 2,
                                                  bottom: 2),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              7.00))))
                                        ]))
                              ]))),
                  Container(
                      width: double.infinity,
                      margin: getMargin(left: 28, top: 15, right: 27),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(getHorizontalSize(12.00))),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(right: 10),
                                child: Text("msg_service_description".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanBold16WhiteA700)),
                            Container(
                                width: double.infinity,
                                margin: getMargin(top: 5),
                                decoration: AppDecoration.fillWhiteA700
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder12),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              width: getHorizontalSize(269.00),
                                              margin: getMargin(
                                                  left: 9,
                                                  top: 11,
                                                  right: 40,
                                                  bottom: 15),
                                              child: Text(
                                                  "msg_this_is_where_all".tr,
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular16)))
                                    ]))
                          ])),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 29, top: 17, right: 29),
                          child: Text("msg_service_provided".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanBold16WhiteA700))),
                  Padding(
                      padding:
                          getPadding(left: 28, top: 8, right: 27, bottom: 105),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                decoration: AppDecoration.fillWhiteA700
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder6),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: CommonImageView(
                                              imagePath: ImageConstant
                                                  .imgInsertpictureicon135x136,
                                              height: getVerticalSize(151.00),
                                              width:
                                                  getHorizontalSize(150.00))),
                                      Padding(
                                          padding: getPadding(
                                              left: 44,
                                              top: 7,
                                              right: 44,
                                              bottom: 8),
                                          child: Text("lbl_service_1".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanRegular15))
                                    ])),
                            Container(
                                margin: getMargin(left: 19),
                                decoration: AppDecoration.fillWhiteA700
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder6),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: CommonImageView(
                                              imagePath: ImageConstant
                                                  .imgInsertpictureicon135x136,
                                              height: getVerticalSize(151.00),
                                              width:
                                                  getHorizontalSize(150.00))),
                                      Padding(
                                          padding: getPadding(
                                              left: 44,
                                              top: 7,
                                              right: 44,
                                              bottom: 8),
                                          child: Text("lbl_service_2".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanRegular15))
                                    ]))
                          ]))
                ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
