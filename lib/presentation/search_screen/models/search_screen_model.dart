import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/utils/color_constant.dart';
import 'package:fyp2/core/utils/size_utils.dart';
import 'package:fyp2/presentation/serviie_provider_page_available_screen/models/service_page_detail_model.dart';
import 'package:fyp2/theme/app_decoration.dart';
import 'package:fyp2/theme/app_style.dart';
import 'package:fyp2/widgets/online_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SearchPageModel extends StatelessWidget {

  final dynamic services;
  SearchPageModel({Key? key, required this.services}) : super(key: key);

  CollectionReference service_provider =
  FirebaseFirestore.instance.collection('service-provider');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: service_provider.doc(services['sid']).get(),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
      return const Text("Something went wrong");
    }
      else{
    Map<String, dynamic> data =
    snapshot.data!.data() as Map<String, dynamic>;
        return InkWell(onTap:(){
          Navigator.push(context,
          MaterialPageRoute(
          builder: (context) => ServicePageDetailModel(services: services,)));},
            child:Padding(padding: getPadding(top:10,right: 25,left: 25),
            child: Container(
                    decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,),
                    width: getHorizontalSize(320),
                    alignment: Alignment.center,
                    child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                      Padding(padding: getPadding(left: 6,top: 5,bottom: 6,),
                                              child: Image.network(services['serimages'][0],
                                                    height: getVerticalSize(67.00,),
                                                    width: getHorizontalSize(62.00,),),),
                                      Padding(padding: getPadding(left: 8,top: 4,bottom: 13,),
                                              child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                                Align(
                                                                  alignment: Alignment.center,
                                                                  child: Container(
                                                                          width: getHorizontalSize(180.00,),
                                                                          margin: getMargin(left: 1,),
                                                                          child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                            Text(services['sername'],
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              textAlign: TextAlign.left,
                                                                                              style: AppStyle.txtRobotoRomanBold16,),
                                                                                            Container(
                                                                                              margin: getMargin(top: 3,bottom: 3,),
                                                                                              child: Stack(
                                                                                                        alignment: Alignment.bottomCenter,
                                                                                                        children: [
                                                                                                                  Align(
                                                                                                                    alignment: Alignment.topRight,
                                                                                                                    child: Container(
                                                                                                                            height: getVerticalSize(10.00,),
                                                                                                                            width: getHorizontalSize(9.00,),
                                                                                                                            margin: getMargin(left: 10,right: 1,bottom: 10,),
                                                                                                                            decoration: BoxDecoration(
                                                                                                                                          color: ColorConstant.whiteA700,
                                                                                                                                          borderRadius: BorderRadius.circular(getHorizontalSize(5.00,),),),),),],),),],),),),
                                                                Padding(padding: getPadding(left: 1,top: 1,right: 10,),
                                                                        child: Text(data['storename'],
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  textAlign: TextAlign.left,
                                                                                  style: AppStyle.txtRobotoRomanLight11,),),
                                                                Padding(padding: getPadding(top: 1,right: 10,),
                                                                        child: Text(('Operation time: ') + data['open']+(' - ') + data['close'],
                                                                        overflow: TextOverflow.ellipsis,
                                                                        textAlign: TextAlign.left,
                                                                        style: AppStyle.txtRobotoRomanLight11,),),
                                                                Padding(padding: getPadding(left: 1,right: 10,),
                                                                        child: Text(('Location:') + (data['location']),
                                                                        overflow: TextOverflow.ellipsis,
                                                                        textAlign: TextAlign.left,
                                                                        style: AppStyle.txtRobotoRomanLight11,),),],),),
                                     Column(
                                       mainAxisSize: MainAxisSize.min,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                       Align(
                                         alignment: Alignment.centerLeft,
                                           child: OnlineWidget(sp: data),),
                                       Padding(padding: getPadding(top: 7),
                                         child: Container(
                                           alignment: Alignment.bottomRight,
                                           child: RichText(
                                             text: TextSpan(
                                               children: [
                                                 TextSpan(
                                                   text: 'Booking Price \n',
                                                   style: TextStyle(
                                                     color: ColorConstant.black900,
                                                     fontSize: getFontSize(12),
                                                     fontFamily: 'Roboto',
                                                     fontWeight: FontWeight.w300,),),
                                                 TextSpan(
                                                   text: 'RM '+services['price'].toString() +'.00',
                                                   style: TextStyle(
                                                     color: ColorConstant.black900,
                                                     fontSize: getFontSize(14),
                                                     fontFamily: 'Roboto',
                                                     fontWeight: FontWeight.w500,),),],),
                                             textAlign: TextAlign.center,),),),
                                     ],) ],),),));
      }});}}
