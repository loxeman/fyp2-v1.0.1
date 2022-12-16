import 'controller/job_page_pending_controller.dart';
import 'models/job_page_pending_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class JobPagePendingPage extends StatelessWidget {
  JobPagePendingController controller =
      Get.put(JobPagePendingController(JobPagePendingModel().obs));

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
                    left: 8,
                    top: 4,
                    bottom: 13,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 1,
                          right: 10,
                        ),
                        child: Text(
                          "lbl_service_name".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanBold16,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 1,
                          top: 1,
                          right: 10,
                        ),
                        child: Text(
                          "lbl_customer_name".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanLight11,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: Text(
                          "msg_appointment_time".tr,
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
                ),
                Padding(
                  padding: getPadding(
                    left: 1,
                    top: 8,
                    right: 5,
                    bottom: 5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getVerticalSize(
                            12.00,
                          ),
                          width: getHorizontalSize(
                            82.00,
                          ),
                          margin: getMargin(
                            right: 2,
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
                                    style: AppStyle.txtRobotoRomanRegular9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        width: 62,
                        text: "lbl_accept".tr,
                        margin: getMargin(
                          left: 10,
                          top: 2,
                        ),
                        shape: ButtonShape.CircleBorder12,
                        padding: ButtonPadding.PaddingAll3,
                        fontStyle: ButtonFontStyle.RobotoRomanMedium10,
                      ),
                      CustomButton(
                        width: 62,
                        text: "lbl_reject".tr,
                        margin: getMargin(
                          left: 10,
                          top: 2,
                        ),
                        variant: ButtonVariant.FillRed900,
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
        ),
      ),
    );
  }
}
