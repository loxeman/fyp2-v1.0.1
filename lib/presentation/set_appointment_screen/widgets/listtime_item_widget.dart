import '../controller/set_appointment_controller.dart';
import '../models/listtime_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';

// ignore: must_be_immutable
class ListtimeItemWidget extends StatelessWidget {
  ListtimeItemWidget(this.listtimeItemModelObj);

  ListtimeItemModel listtimeItemModelObj;

  var controller = Get.find<SetAppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: getMargin(
          top: 6.590004,
          bottom: 6.590004,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
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
                "lbl_time".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRobotoRomanMedium12.copyWith(
                  letterSpacing: 0.12,
                ),
              ),
            ),
            Container(
              margin: getMargin(
                top: 5,
              ),
              decoration: AppDecoration.fillWhiteA700.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 13,
                      top: 12,
                      bottom: 11,
                    ),
                    child: Text(
                      "lbl_select_time".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium16.copyWith(
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 8,
                      right: 7,
                      bottom: 17,
                    ),
                    child: CommonImageView(
                      svgPath: ImageConstant.imgArrowdown16x19,
                      height: getVerticalSize(
                        22.00,
                      ),
                      width: getHorizontalSize(
                        23.00,
                      ),
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
