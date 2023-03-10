import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/presentation/login_page_customer_screen/login_page_customer_screen.dart';
import 'package:fyp2/presentation/login_page_service_screen/login_page_service_screen.dart';
import 'controller/welcomescreen_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

class WelcomePageScreen extends GetWidget<WelcomePageController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray901,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(
                  left: 41,
                  top: 162,
                  right: 41,
                ),
                child: Text(
                  'Hi, Welcome',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanMedium40.copyWith(
                    height: 1.18,
                  ),
                ),
              ),
            ),
            CustomButton(
              width: 200,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginPageCustomerScreen()));
              },
              text: "lbl_customer".tr.toUpperCase(),
              margin: getMargin(
                left: 41,
                top: 105,
                right: 41,
              ),
            ),
            CustomButton(
              width: 200,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginPageServiceScreen()));
              },
              text: "msg_service_provider".tr.toUpperCase(),
              margin: getMargin(
                left: 41,
                top: 17,
                right: 41,
                bottom: 5,
              ),
            ),
          ],
        ),
      ),
    ); }
}
