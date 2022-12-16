import '../controller/dashboard_page_controller.dart';
import '../models/dashboard_page_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';

// ignore: must_be_immutable
class DashboardPageItemWidget extends StatelessWidget {
  DashboardPageItemWidget(this.dashboardPageItemModelObj);

  DashboardPageItemModel dashboardPageItemModelObj;

  var controller = Get.find<DashboardPageController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CommonImageView(
                imagePath: ImageConstant.imgInsertpictureicon135x136,
                height: getVerticalSize(
                  151.00,
                ),
                width: getHorizontalSize(
                  150.00,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 46,
                top: 8,
                right: 45,
                bottom: 6,
              ),
              child: Text(
                "lbl_my_store".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRobotoRomanRegular15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
