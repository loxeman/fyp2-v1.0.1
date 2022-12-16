import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillIndigoA700 => BoxDecoration(
        color: ColorConstant.indigoA700,
      );
  static BoxDecoration get fillGray901 => BoxDecoration(
        color: ColorConstant.gray901,
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: ColorConstant.gray900,
      );
  static BoxDecoration get fillBluegray200 => BoxDecoration(
        color: ColorConstant.bluegray200,
      );
  static BoxDecoration get outlineBlack9000c => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get fillGray700 => BoxDecoration(
        color: ColorConstant.gray700,
      );
  static BoxDecoration get outlineBlack90014 => BoxDecoration(
        color: ColorConstant.gray901,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90014,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillLightgreen800 => BoxDecoration(
        color: ColorConstant.lightGreen800,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get txtFillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder25 = BorderRadius.circular(
    getHorizontalSize(
      25.00,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.00,
    ),
  );

  static BorderRadius txtRoundedBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6.00,
    ),
  );

  static BorderRadius circleBorder9 = BorderRadius.circular(
    getHorizontalSize(
      9.00,
    ),
  );

  static BorderRadius circleBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6.00,
    ),
  );
}
