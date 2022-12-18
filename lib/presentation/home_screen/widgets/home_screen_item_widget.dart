import '../controller/home_controller.dart';
import '../models/home_screen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';

// ignore: must_be_immutable
class CustomerHomeScreenItemWidget extends StatelessWidget {
  CustomerHomeScreenItemWidget(this.CustomerHomeScreenItemModelObj);

  CustomerHomeScreenItemModel CustomerHomeScreenItemModelObj;

  var controller = Get.find<CustomerHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              left: 11,
              top: 7,
              right: 11,
            ),
            child: CommonImageView(
              imagePath: ImageConstant.img29298converted,
              height: getVerticalSize(
                71.00,
              ),
              width: getHorizontalSize(
                75.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 11,
              top: 5,
              right: 11,
              bottom: 3,
            ),
            child: Text(
              "lbl_cleaning".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtRobotoRomanBold14,
            ),
          ),
        ],
      ),
    );
  }
}
