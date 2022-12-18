import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/presentation/search_screen/models/search_screen_model.dart';

import '../search_screen/widgets/search_screen_item_widget.dart';
import 'controller/search_controller.dart';
import 'models/search_screen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_drop_down.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

class SearchScreen extends StatefulWidget {
  final dynamic availability;
  final dynamic category;
  final dynamic location;

  const SearchScreen({Key? key,
    required this.availability,
    required this.category,
    required this.location}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {

  final controller=Get.put(SearchController());

  CollectionReference services =
  FirebaseFirestore.instance.collection('services');
  CollectionReference service_provider =
  FirebaseFirestore.instance.collection('service-provider');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.gray900,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 150,
            automaticallyImplyLeading: false,
            backgroundColor: ColorConstant.gray900,
            title: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomTextFormField(
                width: 320,
                focusNode: FocusNode(),
                controller: controller.group2341Controller,
                hintText: "lbl_search".tr,
                margin: getMargin(),
                shape: TextFormFieldShape.RoundedBorder12,
                fontStyle: TextFormFieldFontStyle.RobotoItalicThin15,
                textInputAction: TextInputAction.done,
                alignment: Alignment.center,
                suffix: Container(
                    margin:
                    getMargin(left: 30, top: 7, right: 14, bottom: 6),
                    child: CommonImageView(
                        svgPath: ImageConstant.imgRefresh)),
                suffixConstraints: BoxConstraints(
                    minWidth: getHorizontalSize(22.00),
                    minHeight: getVerticalSize(24.00))),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: getPadding( top: 7),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomDropDown(
                                width: 157,
                                focusNode: FocusNode(),
                                icon: Container(
                                    margin: getMargin(left: 23, right: 11),
                                    child: CommonImageView(
                                        svgPath:
                                        ImageConstant.imgArrowdown)),
                                hintText: "lbl_availabilty".tr,
                                margin: getMargin(top: 2),
                                padding: DropDownPadding.PaddingAll9,
                                items: controller
                                    .searchModelObj.value.dropdownItemList,
                                onChanged: (value) {
                                  controller.onSelected(value);
                                }),
                            CustomDropDown(
                                width: 157,
                                focusNode: FocusNode(),
                                icon: Container(
                                    margin: getMargin(left: 30, right: 8),
                                    child: CommonImageView(
                                        svgPath:
                                        ImageConstant.imgArrowdown)),
                                hintText: "lbl_category2".tr,
                                margin: getMargin(left: 5, bottom: 2),
                                items: controller
                                    .searchModelObj.value.dropdownItemList1,
                                onChanged: (value) {
                                  controller.onSelected1(value);
                                })
                          ]))),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: getPadding(top: 6),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomDropDown(
                                width: 157,
                                focusNode: FocusNode(),
                                icon: Container(
                                    margin: getMargin(left: 28, right: 11),
                                    child: CommonImageView(
                                        svgPath:
                                        ImageConstant.imgArrowdown)),
                                hintText: "lbl_location".tr,
                                margin: getMargin(top: 1),
                                padding: DropDownPadding.PaddingAll9,
                                items: controller
                                    .searchModelObj.value.dropdownItemList2,
                                onChanged: (value) {
                                  controller.onSelected2(value);
                                }),
                            CustomDropDown(
                                width: 157,
                                focusNode: FocusNode(),
                                icon: Container(
                                    margin: getMargin(left: 16, right: 8),
                                    child: CommonImageView(
                                        svgPath:
                                        ImageConstant.imgArrowdown)),
                                hintText: "lbl_sub_category".tr,
                                margin: getMargin(left: 5, bottom: 1),
                                items: controller
                                    .searchModelObj.value.dropdownItemList3,
                                onChanged: (value) {
                                  controller.onSelected3(value);
                                })
                          ]))),
          ]),),
          body:StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('services').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
    }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
              child: CircularProgressIndicator(),
    );
    }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
              child: Text('No Services Available !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontFamily: 'RobotoRoman',
                      fontSize: 26,
                      letterSpacing: 1.5,
                      color: Colors.white,
    ),));
    }
              else return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return SearchPageModel(
                  services: snapshot.data!.docs[index],
    );
    });
    },),

  ),
    );
  }


  @override
  /*Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                      width: 320,
                      focusNode: FocusNode(),
                      controller: controller.group2341Controller,
                      hintText: "lbl_search".tr,
                      margin: getMargin(left: 28, top: 14, right: 27),
                      shape: TextFormFieldShape.RoundedBorder12,
                      fontStyle: TextFormFieldFontStyle.RobotoItalicThin15,
                      textInputAction: TextInputAction.done,
                      alignment: Alignment.center,
                      suffix: Container(
                          margin:
                              getMargin(left: 30, top: 7, right: 14, bottom: 6),
                          child: CommonImageView(
                              svgPath: ImageConstant.imgRefresh)),
                      suffixConstraints: BoxConstraints(
                          minWidth: getHorizontalSize(22.00),
                          minHeight: getVerticalSize(24.00))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 28, top: 7, right: 27),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomDropDown(
                                    width: 157,
                                    focusNode: FocusNode(),
                                    icon: Container(
                                        margin: getMargin(left: 23, right: 11),
                                        child: CommonImageView(
                                            svgPath:
                                                ImageConstant.imgArrowdown)),
                                    hintText: "lbl_availabilty".tr,
                                    margin: getMargin(top: 2),
                                    padding: DropDownPadding.PaddingAll9,
                                    items: controller
                                        .searchModelObj.value.dropdownItemList,
                                    onChanged: (value) {
                                      controller.onSelected(value);
                                    }),
                                CustomDropDown(
                                    width: 157,
                                    focusNode: FocusNode(),
                                    icon: Container(
                                        margin: getMargin(left: 30, right: 8),
                                        child: CommonImageView(
                                            svgPath:
                                                ImageConstant.imgArrowdown)),
                                    hintText: "lbl_category2".tr,
                                    margin: getMargin(left: 5, bottom: 2),
                                    items: controller
                                        .searchModelObj.value.dropdownItemList1,
                                    onChanged: (value) {
                                      controller.onSelected1(value);
                                    })
                              ]))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 28, top: 6, right: 27),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomDropDown(
                                    width: 157,
                                    focusNode: FocusNode(),
                                    icon: Container(
                                        margin: getMargin(left: 28, right: 11),
                                        child: CommonImageView(
                                            svgPath:
                                                ImageConstant.imgArrowdown)),
                                    hintText: "lbl_location".tr,
                                    margin: getMargin(top: 1),
                                    padding: DropDownPadding.PaddingAll9,
                                    items: controller
                                        .searchModelObj.value.dropdownItemList2,
                                    onChanged: (value) {
                                      controller.onSelected2(value);
                                    }),
                                CustomDropDown(
                                    width: 157,
                                    focusNode: FocusNode(),
                                    icon: Container(
                                        margin: getMargin(left: 16, right: 8),
                                        child: CommonImageView(
                                            svgPath:
                                                ImageConstant.imgArrowdown)),
                                    hintText: "lbl_sub_category".tr,
                                    margin: getMargin(left: 5, bottom: 1),
                                    items: controller
                                        .searchModelObj.value.dropdownItemList3,
                                    onChanged: (value) {
                                      controller.onSelected3(value);
                                    })
                              ]))),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: getPadding(left: 13, top: 7, right: 13),
                          child: CommonImageView(
                              svgPath: ImageConstant.imgGrid,
                              height: getSize(24.00),
                              width: getSize(24.00)))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 13, top: 5, right: 13),
                          child: Obx(() => ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.searchModelObj.value
                                  .searchScreenItemList.length,
                              itemBuilder: (context, index) {
                                SearchScreenItemModel model = controller
                                    .searchModelObj
                                    .value
                                    .searchScreenItemList[index];
                                return SearchScreenItemWidget(model);
                              })))),
                  CustomButton(
                      width: 54,
                      text: "lbl_next".tr,
                      margin:
                          getMargin(left: 13, top: 30, right: 13, bottom: 5),
                      shape: ButtonShape.RoundedBorder6,
                      padding: ButtonPadding.PaddingAll3,
                      fontStyle: ButtonFontStyle.RobotoRomanMedium12,
                      alignment: Alignment.center)
                ])));
  }*/

  onTapImgArrowleft() {
    Get.back();
  }
}
