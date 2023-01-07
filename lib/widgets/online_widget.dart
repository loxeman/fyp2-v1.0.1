import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:fyp2/core/utils/color_constant.dart';
import 'package:fyp2/core/utils/size_utils.dart';
import 'package:fyp2/theme/app_decoration.dart';
import 'package:fyp2/theme/app_style.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class OnlineWidget extends StatefulWidget{

  final dynamic sp;
  OnlineWidget({Key? key, required this.sp}) : super(key: key);

  @override
  _OnlineWidgetState createState() => _OnlineWidgetState();
}

class _OnlineWidgetState extends State<OnlineWidget>{

  late DatabaseReference stateRef = FirebaseDatabase.instance.ref().child("status").child(widget.sp['sid']);
  bool online = false;

  @override
  void initState() {
    checkOnline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(online && widget.sp['autostatus']==1){
      return Container(
          margin: getMargin(top: 10, bottom: 5,),
          height: getVerticalSize(18.00),
          width: getHorizontalSize(61.00),
          decoration: AppDecoration.fillLightgreen800
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder9),
          child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                    alignment:
                    Alignment.centerRight,
                    child: Container(
                        height: getVerticalSize(13.00),
                        width: getHorizontalSize(13.00),
                        margin: getMargin(left: 10, right: 2,),
                        decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(getHorizontalSize(10.00))))),
                Align(
                    alignment:
                    Alignment.centerLeft,
                    child: Padding(
                        padding: getPadding(left: 7),
                        child: Text(
                            "lbl_online".tr,
                            overflow: TextOverflow
                                .ellipsis,
                            textAlign:
                            TextAlign.left,
                            style: AppStyle
                                .txtRobotoRomanRegular12)))
              ]));
    }
    else{
      return Container(
          margin: getMargin(top: 10, bottom: 5,),
          height: getVerticalSize(18.00),
          width: getHorizontalSize(61.00),
          decoration: AppDecoration.fillGray700
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder9),
          child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                    alignment:
                    Alignment.centerLeft,
                    child: Container(
                        height: getVerticalSize(13.00),
                        width: getHorizontalSize(13.00),
                        margin: getMargin(left: 2, right: 10,),
                        decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(getHorizontalSize(10.00))))),
                Align(
                    alignment:
                    Alignment.centerRight,
                    child: Padding(
                        padding: getPadding(right: 7),
                        child: Text(
                            'OFFLINE',
                            overflow: TextOverflow
                                .ellipsis,
                            textAlign:
                            TextAlign.left,
                            style: AppStyle
                                .txtRobotoRomanRegular12)))
              ]));
    }
  }

  Future<void> checkOnline() async{
    final snapshot = await stateRef.child("state").get();
    if(snapshot.value == "online"){
      setState((){
        online = true;
      });
    }
    else {online = false;}
  }

}