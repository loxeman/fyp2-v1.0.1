import 'dart:io';

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
    return InkWell(
      onTap: () { Navigator.push(context,
          MaterialPageRoute(builder: (context) => ServicePageDetailModel(services: services,
    )));},
      child: Padding(padding: getPadding(),
          child: Stack(
              children: [
                Container(
                    decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.circleBorder9),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(9),
                                  topRight: Radius.circular(9)),
                              child:Container(
                                  constraints: const BoxConstraints(minHeight: 20, maxHeight:90),
                                  alignment: Alignment.center,
                                  decoration: services['serimages'][0]== ''
                                      ? BoxDecoration(image: DecorationImage(image: FileImage(File(ImageConstant.imgInsertpictureicon135x136)),fit: BoxFit.fill))
                                  : BoxDecoration(image: DecorationImage(image: NetworkImage(services['serimages'][0]),fit: BoxFit.fill)))),
                          Padding(
                              padding: getPadding(top: 7, bottom: 8),
                              child: Text(services['sername'],
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanRegular15))
                              ]))])
        ));
  }
}
