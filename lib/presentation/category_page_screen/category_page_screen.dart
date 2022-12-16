import '../category_page_screen/widgets/category_page_item_widget.dart';
import 'controller/category_page_controller.dart';
import 'models/category_page_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';

class CategoryPageScreen extends GetWidget<CategoryPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Column(
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
                          padding: getPadding(left: 14, top: 27, right: 14),
                          child: Text("lbl_category2".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanBold34))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 14, top: 39, right: 14),
                          child: Obx(() => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: getVerticalSize(105.00),
                                      crossAxisCount: 3,
                                      mainAxisSpacing: getHorizontalSize(12.13),
                                      crossAxisSpacing:
                                          getHorizontalSize(12.13)),
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.categoryPageModelObj.value
                                  .categoryPageItemList.length,
                              itemBuilder: (context, index) {
                                CategoryPageItemModel model = controller
                                    .categoryPageModelObj
                                    .value
                                    .categoryPageItemList[index];
                                return CategoryPageItemWidget(model);
                              })))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 14, top: 19, right: 14),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 11, top: 7, right: 11),
                                              child: CommonImageView(
                                                  imagePath: ImageConstant
                                                      .img29298converted,
                                                  height:
                                                      getVerticalSize(71.00),
                                                  width: getHorizontalSize(
                                                      75.00))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 11,
                                                  top: 5,
                                                  right: 11,
                                                  bottom: 3),
                                              child: Text("lbl_cleaning".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold14))
                                        ])),
                                Container(
                                    margin: getMargin(left: 12),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 18, top: 3, right: 18),
                                              child: CommonImageView(
                                                  imagePath: ImageConstant
                                                      .img40999converted,
                                                  height:
                                                      getVerticalSize(75.00),
                                                  width: getHorizontalSize(
                                                      47.00))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 18,
                                                  top: 4,
                                                  right: 18,
                                                  bottom: 4),
                                              child: Text("lbl_electrical".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold14))
                                        ])),
                                Container(
                                    margin: getMargin(left: 11),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding: getPadding(
                                                      left: 21, right: 21),
                                                  child: CommonImageView(
                                                      imagePath: ImageConstant
                                                          .img19191converted,
                                                      height: getVerticalSize(
                                                          78.00),
                                                      width: getHorizontalSize(
                                                          51.00)))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 24,
                                                  top: 6,
                                                  right: 20,
                                                  bottom: 2),
                                              child: Text("lbl_plumber".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold14))
                                        ]))
                              ]))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(
                              left: 14, top: 19, right: 14, bottom: 160),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: getPadding(top: 25),
                                                  child: CommonImageView(
                                                      imagePath: ImageConstant
                                                          .img17205converted,
                                                      height: getVerticalSize(
                                                          54.00),
                                                      width: getHorizontalSize(
                                                          98.00)))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: getPadding(
                                                      left: 16,
                                                      top: 2,
                                                      right: 16,
                                                      bottom: 5),
                                                  child: Text("lbl_mechanic".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtRobotoRomanBold14)))
                                        ])),
                                Container(
                                    margin: getMargin(left: 12),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: getPadding(top: 14),
                                                  child: CommonImageView(
                                                      imagePath: ImageConstant
                                                          .img51384361,
                                                      height: getVerticalSize(
                                                          59.00),
                                                      width: getHorizontalSize(
                                                          98.00)))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 6,
                                                  top: 8,
                                                  right: 10,
                                                  bottom: 5),
                                              child: Text("lbl_construction".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold14))
                                        ])),
                                Container(
                                    margin: getMargin(left: 11),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: getPadding(top: 24),
                                                  child: CommonImageView(
                                                      imagePath: ImageConstant
                                                          .imgLogisticworkers,
                                                      height: getVerticalSize(
                                                          49.00),
                                                      width: getHorizontalSize(
                                                          98.00)))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 23,
                                                  top: 9,
                                                  right: 23,
                                                  bottom: 4),
                                              child: Text("lbl_logistic".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold14))
                                        ]))
                              ])))
                ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
