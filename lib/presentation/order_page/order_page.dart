import 'controller/order_controller.dart';
import 'models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class OrderPage extends StatelessWidget {
  OrderController controller = Get.put(OrderController(OrderModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            decoration: AppDecoration.fillWhiteA700.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    left: 8,
                    top: 4,
                    right: 5,
                    bottom: 5,
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
                            233.00,
                          ),
                          margin: getMargin(
                            left: 1,
                            right: 2,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "lbl_service_name".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRobotoRomanBold16,
                              ),
                              Container(
                                height: getVerticalSize(
                                  12.00,
                                ),
                                width: getHorizontalSize(
                                  82.00,
                                ),
                                margin: getMargin(
                                  top: 3,
                                  bottom: 3,
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        height: getVerticalSize(
                                          10.00,
                                        ),
                                        width: getHorizontalSize(
                                          9.00,
                                        ),
                                        margin: getMargin(
                                          left: 10,
                                          right: 1,
                                          bottom: 10,
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
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: getPadding(
                                          top: 10,
                                        ),
                                        child: Text(
                                          "msg_order_id_223323232".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtRobotoRomanRegular9,
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
                          237.00,
                        ),
                        margin: getMargin(
                          top: 1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 8,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "msg_appointment_time".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanLight11,
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
                            ),
                            CustomButton(
                              width: 62,
                              text: "lbl_complete".tr,
                              margin: getMargin(
                                top: 10,
                              ),
                              shape: ButtonShape.CircleBorder12,
                              padding: ButtonPadding.PaddingAll3,
                              fontStyle: ButtonFontStyle.RobotoRomanMedium10,
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
        ),
      ),
    );
  }
}
