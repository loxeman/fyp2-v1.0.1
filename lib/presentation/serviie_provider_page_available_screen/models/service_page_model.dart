import 'package:flutter/material.dart';
import 'package:fyp2/core/utils/image_constant.dart';
import 'package:fyp2/core/utils/size_utils.dart';
import 'package:fyp2/presentation/serviie_provider_page_available_screen/models/service_page_detail_model.dart';
import 'package:fyp2/theme/app_decoration.dart';
import 'package:fyp2/theme/app_style.dart';
import 'package:fyp2/widgets/common_image_view.dart';

class ServicePageModel extends StatelessWidget {

  final dynamic services;
  const ServicePageModel({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: getPadding(),
        child: Container(
                child: Stack(
                    children: [
                      Container(
                          decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.circleBorder6),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:CrossAxisAlignment.center,
                              mainAxisAlignment:MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child:InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ServicePageDetailModel(
                                                    services: services,
                                                  )));},
                                      child: services['serimages'][0]== '' ? CommonImageView(
                                        imagePath: ImageConstant.imgInsertpictureicon135x136,
                                        height: getVerticalSize(151.00),
                                        width: getHorizontalSize(50.00))
                                        : Image.network(services['serimages'][0],
                                        height: getVerticalSize(151.00),
                                        width: getHorizontalSize(50.00))),),
                                Padding(
                                    padding: getPadding(left: 44, top: 7, right: 44, bottom: 8),
                                    child: Text(services['sername'],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtRobotoRomanRegular15))
                              ]))]))
        );
  }
}
