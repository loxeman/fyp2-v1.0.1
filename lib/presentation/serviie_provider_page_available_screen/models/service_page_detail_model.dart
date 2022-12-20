import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/core/utils/color_constant.dart';
import 'package:fyp2/core/utils/image_constant.dart';
import 'package:fyp2/core/utils/size_utils.dart';
import 'package:fyp2/presentation/edit_service_page_one_screen/edit_service_page_one_screen.dart';
import 'package:fyp2/presentation/set_appointment_screen/set_appointment_screen.dart';
import 'package:fyp2/theme/app_decoration.dart';
import 'package:fyp2/theme/app_style.dart';
import 'package:fyp2/widgets/common_image_view.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ServicePageDetailModel extends StatefulWidget {
final dynamic services;

const ServicePageDetailModel({Key? key, required this.services}) : super(key: key);

@override
State<ServicePageDetailModel> createState() => _ServicePageDetailModel();
}

class _ServicePageDetailModel extends State<ServicePageDetailModel> {
  
  /*late final Stream<QuerySnapshot> prodcutsStream = FirebaseFirestore.instance
      .collection('services')
      .where('maincateg', isEqualTo: widget.services['maincateg'])
      .where('subcateg', isEqualTo: widget.services['subcateg'])
      .snapshots();*/

  /*late final Stream<QuerySnapshot> reviewsStream = FirebaseFirestore.instance
      .collection('services')
      .doc(widget.services['serid'])
      .collection('reviews')
      .snapshots();*/

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  late List<dynamic> imagesList = widget.services['serimages'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: AppBarBackButton(),
            ),
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.gray900,
            body: SingleChildScrollView(
              child:Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            height: getVerticalSize(185.00),
                            width: size.width,
                            decoration: widget.services['coverimage'] == '' ? BoxDecoration(color: ColorConstant.indigoA700)
                                : BoxDecoration(image: DecorationImage(image: NetworkImage(widget.services['coverimage']), fit: BoxFit.fill)),
                            child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                      padding: getPadding(left: 13, top: 10, right: 13, bottom: 10),
                                      child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                                height: getVerticalSize(135.00),
                                                width: getHorizontalSize(136.00),
                                                child: Stack(
                                                    alignment:
                                                    Alignment.centerLeft,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Container(
                                                              height: getVerticalSize(107.00),
                                                              width: getHorizontalSize(109.00),
                                                              margin: getMargin(left: 20, top: 10, right: 12, bottom: 5),

                                                      child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: widget.services['serimages'][0] == '' ? CommonImageView(
                                                             imagePath: ImageConstant.imgInsertpictureicon135x136,
                                                             height: getVerticalSize(135.00),
                                                             width: getHorizontalSize(136.00))
                                                        : Image.network(widget.services['serimages'][0],
                                                              height: getVerticalSize(135.00),
                                                              width: getHorizontalSize(136.00))
                                                          )))
                                                    ])),
                                            Padding(
                                                padding: getPadding(
                                                    left: 20,
                                                    top: 30,
                                                    bottom: 40),
                                                child: Text(
                                                    widget.services['sername'],
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanBold34WhiteA700))
                                          ]))))),
                    Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                      margin: getMargin(left: 27, top: 10, right: 27, bottom: 9),
                                      decoration: AppDecoration.fillBluegray200.copyWith(borderRadius: BorderRadiusStyle.circleBorder6),
                                      child: widget.services['sid'] != FirebaseAuth.instance.currentUser!.uid ? const SizedBox()
                                      : Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: getPadding(left: 6, top: 6, bottom: 7),
                                                child:InkWell(
                                                    onTap: (){Navigator.push(
                                                        context, MaterialPageRoute(
                                                        builder: (context) => EditServicePageOneScreen(services: widget.services)));},
                                                    child: CommonImageView(imagePath: ImageConstant.imgEditing1,
                                                    height: getSize(15.00),
                                                    width: getSize(15.00)))
                                                ),
                                            Padding(
                                                padding: getPadding(
                                                    left: 5,
                                                    top: 6,
                                                    right: 4,
                                                    bottom: 6),
                                                child: TextButton(onPressed: (){Navigator.push(
                                                    context, MaterialPageRoute(
                                                    builder: (context) => EditServicePageOneScreen(services: widget.services)));},
                                                    child: Text("lbl_edit_service".tr,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle
                                                            .txtRobotoRomanRegular12Black900))
                                                )
                                          ]))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: getMargin(left: 28, top: 30, right: 28),
                            decoration: AppDecoration.fillWhiteA700.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder6),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                      padding:
                                      getPadding(left: 3, top: 8, bottom: 4),
                                      child: Text("msg_service_provider4".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtRobotoRomanRegular12Black900)),
                                  Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin:
                                      getMargin(left: 29, top: 5, bottom: 5),
                                      color: ColorConstant.lightGreen800,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadiusStyle.circleBorder9),
                                      child: Container(
                                          height: getVerticalSize(18.00),
                                          width: getHorizontalSize(61.00),
                                          decoration: AppDecoration
                                              .fillLightgreen800
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder9),
                                          child: Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                Align(
                                                    alignment:
                                                    Alignment.centerRight,
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            14.00),
                                                        width: getHorizontalSize(
                                                            13.00),
                                                        margin: getMargin(
                                                            left: 10,
                                                            top: 2,
                                                            right: 1,
                                                            bottom: 2),
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    7.00))))),
                                                Align(
                                                    alignment:
                                                    Alignment.bottomLeft,
                                                    child: Padding(
                                                        padding: getPadding(
                                                            left: 4,
                                                            top: 10,
                                                            right: 10,
                                                            bottom: 1),
                                                        child: Text(
                                                            "lbl_online".tr,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign.left,
                                                            style: AppStyle
                                                                .txtRobotoRomanRegular12)))
                                              ])))
                                ]))),
                    Padding(
                        padding: getPadding(left: 28, top: 6, right: 27),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                  padding: getPadding(
                                      left: 2, top: 6, right: 2, bottom: 6),
                                  decoration: AppDecoration.txtFillWhiteA700
                                      .copyWith(
                                      borderRadius: BorderRadiusStyle
                                          .txtRoundedBorder6),
                                  child: Text('Estimated Duration: ' + widget.services['duration'],
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtRobotoRomanRegular12Black900)),
                              Container(
                                  margin: getMargin(left: 7),
                                  padding: getPadding(
                                      left: 2, top: 4, right: 2, bottom: 4),
                                  decoration: AppDecoration.txtFillWhiteA700
                                      .copyWith(
                                      borderRadius: BorderRadiusStyle
                                          .txtRoundedBorder6),
                                  child: Text('Booking Price: RM ' + widget.services['price'],
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtRobotoRomanRegular12Black900))
                            ])),
                    Container(
                        width: 320,
                        margin:
                        getMargin(left: 28, top: 24, right: 27, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(getHorizontalSize(12.00))),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(right: 10),
                                  child: Text("msg_service_description".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtRobotoRomanBold16WhiteA700)),
                              Container(
                                  width: double.infinity,
                                  margin: getMargin(top: 5),
                                  decoration: AppDecoration.fillWhiteA700
                                      .copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder12),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                                width: getHorizontalSize(269.00),
                                                margin: getMargin(
                                                    left: 9,
                                                    top: 11,
                                                    right: 40,
                                                    bottom: 5),
                                                child: Text(widget.services['serdesc'],
                                                    maxLines: null,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanRegular16)))
                                      ]))
                            ])),
                    Padding(
                        padding:
                        getPadding(left: 28, top: 265, right: 28, bottom: 68),
                        child: widget.services['sid'] == FirebaseAuth.instance.currentUser!.uid ? const SizedBox()
                        :Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CustomButton(
                                  onTap: (){Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SetAppointmentScreen()));},
                                  width: 150,
                                  text: "lbl_book_now".tr,
                                  variant: ButtonVariant.FillLightgreen800,
                                  shape: ButtonShape.RoundedBorder1),
                              CustomButton(
                                  width: 150,
                                  onTap: (){Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SetAppointmentScreen()));},
                                  text: "lbl_book_later".tr,
                                  margin: getMargin(left: 9))
                            ]))
                  ]),)
            ));
  }
}

/*class ProDetailsHeader extends StatelessWidget {
  final String label;
  const ProDetailsHeader({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.yellow.shade900,
              thickness: 1,
            ),
          ),
          Text(
            label,
            style: TextStyle(
                color: Colors.yellow.shade900,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.yellow.shade900,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

Widget reviews(var reviewsStream) {
  return ExpandablePanel(
      header: const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Reviews',
          style: TextStyle(
              color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      collapsed: SizedBox(
        height: 230,
        child: reviewsAll(reviewsStream),
      ),
      expanded: reviewsAll(reviewsStream));
}*/

Widget reviewsAll(var reviewsStream) {
  return StreamBuilder<QuerySnapshot>(
    stream: reviewsStream,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot2) {
      if (snapshot2.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (snapshot2.data!.docs.isEmpty) {
        return const Center(
            child: Text(
              'This Item \n\n has no Reviews yet !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Acme',
                  letterSpacing: 1.5),
            ));
      }

      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot2.data!.docs.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      snapshot2.data!.docs[index]['profileimage'])),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(snapshot2.data!.docs[index]['name']),
                    Row(
                      children: [
                        Text(snapshot2.data!.docs[index]['rate'].toString()),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        )
                      ],
                    )
                  ]),
              subtitle: Text(snapshot2.data!.docs[index]['comment']),
            );
          });
    },
  );
}