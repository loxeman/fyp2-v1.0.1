import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/presentation/edit_store_page_screen/edit_store_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/serviie_provider_page_available_screen/models/service_page_model.dart';
import 'package:fyp2/widgets/online_widget.dart';

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
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 100,
              flexibleSpace: data['coverimage'] == ''
                  ? Container(color: ColorConstant.indigoA700,)
                  : Image.network(
                data['coverimage'],
                fit: BoxFit.cover,
              ),
              title: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: ColorConstant.gray900),
                        borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: data['storelogo'] == '' ? CommonImageView(
                          imagePath: ImageConstant.imgInsertpictureicon85x82,fit: BoxFit.cover)
                          :Image.network(
                        data['storelogo'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data['storename'].toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: getMargin(left: 28, top: 37, right: 27,),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder6,),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              margin: getMargin(left: 8, top: 7, bottom: 5,),
                              child: Padding(padding: getPadding(right: 7),
                                child: Text(data['openh'] == null ? 'Not set yet'
                                    : 'Operation time: ' +
                                    data['openh'].toString().padLeft(2,'0') + ':' + data['openm'].toString().padLeft(2,'0') + ' - ' +
                                    data['closeh'].toString().padLeft(2,'0') + ':' + data['closem'].toString().padLeft(2,'0'),
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanRegular15,),)
                          ),),
                      ),
                      Align(alignment: Alignment.centerLeft,
                        child: ElevatedButton.icon(
                          onPressed: () {Navigator.push(context,
                              MaterialPageRoute(builder: (context) => EditStorePageScreen()));},
                          icon: Icon( // <-- Icon
                            Icons.edit,
                            color: ColorConstant.gray900,
                            size: 11.0,
                          ),
                          label: Text('Edit Store',
                            style: TextStyle(
                              color: ColorConstant.gray900,
                              fontSize: 11,
                              fontFamily: 'Roboto',
                            ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.gray600,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),// <-- Text
                        ),)
                    ],),
                  Container(
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
                            margin: getMargin(left: 8, top: 7, bottom: 5,),
                            child: Text('Location: ',
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular15,),),),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: getMargin(top: 7, right: 7, bottom: 5,),
                            child: Text(data['location'] == '' ? 'Not yet set'
                                : data['location'],
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular15,),),),
                      ],
                    ),
                  ),
                  Container(
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
                            margin: getMargin(left: 8, top: 7, bottom: 5,),
                            child: Text("msg_service_provider4".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular15,),),),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(padding: getPadding(left: 7,right: 7, bottom: 2), child: OnlineWidget(sp:data),)),
                      ],
                    ),
                  ),
                  Container(
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
                            textAlign: TextAlign.justify,
                            style: AppStyle.txtRobotoRomanBold16WhiteA700,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: getMargin(top: 5,),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: getHorizontalSize(
                                    320,
                                  ),
                                  margin: getMargin(
                                    left: 9,
                                    top: 11,
                                    right: 9,
                                    bottom: 15,
                                  ),
                                  child: Text(data['desc'] == '' ? 'Not yet set'
                                      : data['desc'],
                                    maxLines: null,
                                    textAlign: TextAlign.justify,
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
                              padding: getPadding(left: 30,right: 30, top: 10),
                              itemCount: snapshot.data!.docs.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                              ),
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
