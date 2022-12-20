import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/online_offline.dart';
import 'package:fyp2/presentation/edit_store_page_screen/edit_store_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/serviie_provider_page_available_screen/models/service_page_model.dart';

class ServiceProviderHomepageScreen extends StatefulWidget {
  final String suppId;
  const ServiceProviderHomepageScreen({Key? key, required this.suppId}) : super(key: key);

  @override
  State<ServiceProviderHomepageScreen> createState() => _ServiceProviderHomepageScreen();
}

class _ServiceProviderHomepageScreen extends State<ServiceProviderHomepageScreen> with WidgetsBindingObserver{

  CollectionReference services =
  FirebaseFirestore.instance.collection('service-provider');

  @override
  void initState() {
    super.initState();
    UserPresence().UpdatePresence();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
        future: services.doc(widget.suppId).get(),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        return const Text("Document does not exist");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
        snapshot.data!.data() as Map<String, dynamic>;
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: SingleChildScrollView(
              child:Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: getVerticalSize(
                        185.00,
                      ),
                      width: size.width,
                      decoration: AppDecoration.fillIndigoA700,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 82,
                              height: 36,
                              margin: getMargin(
                                left: 27,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              decoration: AppDecoration.fillBluegray200.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder6,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      left: 7,
                                      top: 6,
                                      bottom: 7,
                                    ),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditStorePageScreen()));
                                        },
                                        child: CommonImageView(
                                          imagePath: ImageConstant.imgEditing1,
                                          height: getSize(
                                            15.00,
                                          ),
                                          width: getSize(
                                            15.00,
                                          ),)

                                    ),
                                  ),
                                  Padding(
                                      padding: getPadding(
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      child: TextButton(onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditStorePageScreen()));
                                      },
                                        child: Text(
                                          "lbl_edit_store".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtRobotoRomanRegular12Black900,
                                        ),)

                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: getPadding(
                                left: 13,
                                top: 10,
                                right: 13,
                                bottom: 10,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: getVerticalSize(
                                      135.00,
                                    ),
                                    width: getHorizontalSize(
                                      136.00,
                                    ),
                                    child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: data['storelogo'] == '' ? CommonImageView(
                                            imagePath: ImageConstant.imgInsertpictureicon135x136,
                                            height: getVerticalSize(135.00,),
                                            width: getHorizontalSize(136.00,),
                                          )
                                          : Image.network(data['storelogo'],
                                            height: getVerticalSize(135.00,),
                                            width: getHorizontalSize(136.00,),)
                                        ),
                                  ),
                                  Container(
                                    width: getHorizontalSize(
                                      115.00,
                                    ),
                                    margin: getMargin(
                                      left: 20,
                                      top: 12,
                                      bottom: 49,
                                    ),
                                    child: Text(
                                      data['storename'],
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoRomanBold24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: 320,
                      margin: getMargin(left: 28, top: 23, right: 27,),
                      decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder6,),
                      child: Text(
                          data['open'] == '' ? 'Not set yet'
                              : 'Operation time: ' + data['open'] + ' - ' +
                              data['close'],
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanRegular15
                      )
                  ),
                  Container(
                    width: 320,
                    margin: getMargin(left: 28, top: 7, right: 27,),
                    decoration: AppDecoration.fillWhiteA700.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder6,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: getHorizontalSize(60.00,),
                            margin: getMargin(
                              left: 8, top: 7, right: 25, bottom: 5,),
                            child: Text('Location: ',
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular15,),),),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: getMargin(
                              left: 8, top: 7, right: 7, bottom: 5,),
                            child: Text(data['location'] == '' ? 'Not yet set'
                                : data['location'],
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular15,),),),
                      ],
                    ),
                  ),
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
                  /*Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: getMargin(left: 28, top: 8, right: 28,),
                      decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder6,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 4, top: 4, bottom: 5,),
                            child: Text(
                              "lbl_current_status".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular15,
                            ),
                          ),
                          Container(
                            margin: getMargin(
                              left: 7,
                              top: 5,
                              bottom: 5,
                            ),
                            decoration: AppDecoration.fillGray700.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder9,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: getSize(
                                    14.00,
                                  ),
                                  width: getSize(
                                    14.00,
                                  ),
                                  margin: getMargin(
                                    left: 1,
                                    top: 2,
                                    bottom: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        7.00,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 1,
                                    top: 2,
                                    right: 3,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "lbl_offline".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanRegular12,
                                  ),
                                ),
                              ],
                            ),
                          ), //Todo online widget
                        ],
                      ),
                    ),
                  ),*/                  Container(
                    width: double.infinity,
                    margin: getMargin(left: 28, top: 24, right: 27,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(12.00,),),),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            right: 10,
                          ),
                          child: Text(
                            "msg_service_description".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanBold16WhiteA700,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: getMargin(
                            top: 5,
                          ),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: getHorizontalSize(
                                    269.00,
                                  ),
                                  margin: getMargin(
                                    left: 9,
                                    top: 11,
                                    right: 40,
                                    bottom: 15,
                                  ),
                                  child: Text(data['desc'] == '' ? 'Not yet set'
                                      : data['desc'],
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanRegular16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 29,
                        top: 23,
                        right: 29,
                      ),
                      child: Text(
                        "msg_service_provided".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRomanBold16WhiteA700,
                      ),
                    ),
                  ),
                  Padding(padding: getPadding(),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('services')
                            .where('sid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
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
                                child: Text(
                                  'This Store \n\n has no items yet !',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      letterSpacing: 1.5),
                                ));
                          }

                          return SingleChildScrollView(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return ServicePageModel(
                                  services: snapshot.data!.docs[index],);
                              },),
                          );
                        },
                      )),
                ],
              ),
            )

          ),
        );
      }
      return const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ));
    });
  }
}
