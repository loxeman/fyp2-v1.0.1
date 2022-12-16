import 'controller/serviice_provider_page_not_available_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

class ServiiceProviderPageNotAvailableScreen
    extends GetWidget<ServiiceProviderPageNotAvailableController> {
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
                                        getPadding(left: 4, top: 8, bottom: 4),
                                    child: Text("msg_service_provider4".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtRobotoRomanRegular12Black900)),
                                Container(
                                    margin:
                                        getMargin(left: 44, top: 5, bottom: 5),
                                    decoration: AppDecoration.fillGray700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder9),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                              height: getSize(14.00),
                                              width: getSize(14.00),
                                              margin: getMargin(
                                                  left: 2, top: 2, bottom: 2),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              7.00)))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 1,
                                                  top: 2,
                                                  right: 3,
                                                  bottom: 1),
                                              child: Text("lbl_offline".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular12))
                                        ]))
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
                      margin: getMargin(left: 28, top: 24, right: 27),
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
                  Padding(
                      padding:
                          getPadding(left: 28, top: 265, right: 28, bottom: 68),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomButton(
                                width: 150,
                                text: "lbl_book_now".tr,
                                variant: ButtonVariant.FillGray700,
                                shape: ButtonShape.RoundedBorder1),
                            CustomButton(
                                width: 150,
                                text: "lbl_book_later".tr,
                                margin: getMargin(left: 9))
                          ]))
                ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
