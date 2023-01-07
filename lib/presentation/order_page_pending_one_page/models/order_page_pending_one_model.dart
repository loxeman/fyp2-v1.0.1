import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/utils/color_constant.dart';
import 'package:fyp2/core/utils/size_utils.dart';
import 'package:fyp2/theme/app_decoration.dart';
import 'package:fyp2/theme/app_style.dart';
import 'package:fyp2/widgets/alert_dialog.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderPageOngoingModel extends StatelessWidget {

final dynamic order;
const OrderPageOngoingModel({Key? key, required this.order}) : super(key: key);

@override
Widget build(BuildContext context) {
  return InkWell(
    onTap: (){MakeCallAlertDialog.showMyDialog(context: context,
        title: 'Contact Service Provider',
        content: 'Are you want to contact service provider ?',
        tabNo: () {
          Navigator.pop(context);
        },
        tabYes: () async {
          Uri phoneno = Uri.parse(order['sernum']);
          await launchUrl(phoneno);
        });},
    child:Padding(
      padding: getPadding(top:10,right: 25,left: 25),
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
              child: Image.network(order['serimage'],
                height: getVerticalSize(67.00,),
                width: getHorizontalSize(62.00,),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 8,
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
                        165.00,
                      ),
                      margin: getMargin(
                        left: 1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            order['sername'],
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
                      order['storename'],
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRobotoRomanLight11,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 1,
                      right: 10,
                    ),
                    child: Text(
                      order['appointment'],
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
                      ('Location:') + (order['location']),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRobotoRomanLight11,
                    ),
                  ),
                ],
              ),
            ),
                  CustomButton(
              width: 68,
              onTap: ()async {
                  ConfirmAlertDialog.showMyDialog(context: context,
                  title: 'Confirm Complete',
                  content: 'Are you sure to mark this order as completed?',
                  tabNo: () {
                    Navigator.pop(context);
                  },
                tabYes: () async {
                  Navigator.pop(context);
                await FirebaseFirestore.instance
                    .collection('order')
                    .doc(order['orderid'])
                    .update({
                  'status': 'complete',
                });
              });},
              text: "lbl_complete".tr,
              margin: getMargin(top:16),
              shape: ButtonShape.CircleBorder12,
              fontStyle: ButtonFontStyle.RobotoRomanMedium10,
            )

          ],
        ),
      ),)
  );
    }}


