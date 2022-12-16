import 'controller/serviice_provider_page_available_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';

class ServiiceProviderPageAvailableScreen
    extends GetWidget<ServiiceProviderPageAvailableController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
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
                                          Padding(
                                              padding: getPadding(
                                                  left: 20,
                                                  top: 30,
                                                  bottom: 40),
                                              child: Text(
                                                  "lbl_service_name2".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold34WhiteA700))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    margin: getMargin(
                                        left: 27,
                                        top: 10,
                                        right: 27,
                                        bottom: 9),
                                    decoration: AppDecoration.fillBluegray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder6),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 6, top: 6, bottom: 7),
                                              child: CommonImageView(
                                                  imagePath:
                                                      ImageConstant.imgEditing1,
                                                  height: getSize(15.00),
                                                  width: getSize(15.00))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 5,
                                                  top: 6,
                                                  right: 4,
                                                  bottom: 6),
                                              child: Text("lbl_edit_service".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular12Black900))
                                        ])))
                          ]))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: getMargin(left: 28, top: 30, right: 28),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder6),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding:
                                        getPadding(left: 3, top: 8, bottom: 4),
                                    child: Text("msg_service_provider4".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtRobotoRomanRegular12Black900)),
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin:
                                        getMargin(left: 29, top: 5, bottom: 5),
                                    color: ColorConstant.lightGreen800,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder9),
                                    child: Container(
                                        height: getVerticalSize(18.00),
                                        width: getHorizontalSize(61.00),
                                        decoration: AppDecoration
                                            .fillLightgreen800
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder9),
                                        child: Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                      height: getVerticalSize(
                                                          14.00),
                                                      width: getHorizontalSize(
                                                          13.00),
                                                      margin: getMargin(
                                                          left: 10,
                                                          top: 2,
                                                          right: 1,
                                                          bottom: 2),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      7.00))))),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 4,
                                                          top: 10,
                                                          right: 10,
                                                          bottom: 1),
                                                      child: Text(
                                                          "lbl_online".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanRegular12)))
                                            ])))
                              ]))),
                  Padding(
                      padding: getPadding(left: 28, top: 6, right: 27),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                padding: getPadding(
                                    left: 2, top: 6, right: 2, bottom: 6),
                                decoration: AppDecoration.txtFillWhiteA700
                                    .copyWith(
                                        borderRadius: BorderRadiusStyle
                                            .txtRoundedBorder6),
                                child: Text("msg_estimated_duration".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanRegular12Black900)),
                            Container(
                                margin: getMargin(left: 7),
                                padding: getPadding(
                                    left: 2, top: 4, right: 2, bottom: 4),
                                decoration: AppDecoration.txtFillWhiteA700
                                    .copyWith(
                                        borderRadius: BorderRadiusStyle
                                            .txtRoundedBorder6),
                                child: Text("msg_booking_price_rm".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanRegular12Black900))
                          ])),
                  Container(
                      width: double.infinity,
                      margin:
                          getMargin(left: 28, top: 24, right: 27, bottom: 5),
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
                                                  bottom: 5),
                                              child: Text(
                                                  "msg_this_is_where_all".tr,
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular16)))
                                    ]))
                          ]))
                ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
