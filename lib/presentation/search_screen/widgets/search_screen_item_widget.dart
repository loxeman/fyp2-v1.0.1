import '../controller/search_controller.dart';
import '../models/search_screen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';

// ignore: must_be_immutable
class SearchScreenItemWidget extends StatelessWidget {
  SearchScreenItemWidget(this.searchScreenItemModelObj);

  SearchScreenItemModel searchScreenItemModelObj;

  var controller = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: getMargin(
          top: 4.5,
          bottom: 4.5,
        ),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                left: 6,
                top: 5,
                bottom: 6,
              ),
              child: CommonImageView(
                imagePath: ImageConstant.imgInsertpictureicon,
                height: getVerticalSize(
                  67.00,
                ),
                width: getHorizontalSize(
                  62.00,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 9,
                top: 4,
                right: 7,
                bottom: 13,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(
                        232.00,
                      ),
                      margin: getMargin(
                        left: 1,
                        right: 1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "lbl_service_name".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanBold16,
                          ),
                          Container(
                            margin: getMargin(
                              top: 2,
                              bottom: 4,
                            ),
                            decoration:
                                AppDecoration.fillLightgreen800.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder6,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 1,
                                    bottom: 2,
                                  ),
                                  child: Text(
                                    "lbl_online".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanRegular6,
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(
                                    10.00,
                                  ),
                                  width: getHorizontalSize(
                                    9.00,
                                  ),
                                  margin: getMargin(
                                    all: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        5.00,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 1,
                      top: 1,
                      right: 10,
                    ),
                    child: Text(
                      "msg_service_provider2".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRobotoRomanLight11,
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      234.00,
                    ),
                    margin: getMargin(
                      top: 1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "msg_operation_time".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRobotoRomanLight11,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 1,
                                right: 10,
                              ),
                              child: Text(
                                "msg_location_gombak".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRobotoRomanLight11,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: getHorizontalSize(
                            66.00,
                          ),
                          margin: getMargin(
                            top: 4,
                            bottom: 1,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_booking_price".tr,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      11,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextSpan(
                                  text: "lbl_rm50_00".tr,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      11,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
