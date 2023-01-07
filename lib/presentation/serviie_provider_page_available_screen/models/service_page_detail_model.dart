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
import 'package:fyp2/widgets/online_widget.dart';
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
  CollectionReference serviceprovider =
  FirebaseFirestore.instance.collection('service-provider');

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  late List<dynamic> imagesList = widget.services['serimages'];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: serviceprovider.doc(widget.services['sid']).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              color: ColorConstant.indigoA700,
                              child:Row(
                                children: [
                                  Container(
                                      color: ColorConstant.indigoA700,
                                      height: getVerticalSize(107.00),
                                      width: size.width*0.3,
                                      margin: getMargin(left: 20, top: 70, right: 12, bottom: 10),
                                      child: widget.services['serimages'][0] == '' ? CommonImageView(
                                          imagePath: ImageConstant.imgInsertpictureicon135x136,
                                          height: getVerticalSize(135.00),
                                          width: getHorizontalSize(136.00))
                                          : Image.network(widget.services['serimages'][0],
                                          height: getVerticalSize(135.00),
                                          width: getHorizontalSize(136.00))
                                  ),
                                  Container(
                                      padding: getPadding(left: 20, top: 70, bottom: 40),
                                      width: size.width*0.6,
                                      child: Text(
                                          widget.services['sername'],
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtRobotoRomanBold34WhiteA700))
                                ],
                              ) ,
                            )
                            ,
                            Row(
                              children: [
                                Container(
                                    margin: getMargin(left: 28, top: 37, right: 26,),
                                    padding: getPadding(
                                      left: 8, top: 7, bottom: 7,right: 8),
                                    decoration: AppDecoration.txtFillWhiteA700.copyWith(
                                        borderRadius: BorderRadiusStyle.txtRoundedBorder6),
                                      child: Text(data['open'] == '' ? 'Not set yet'
                                          : 'Operation time: ' + data['openh'].toString().padLeft(2,'0') + ':' + data['openm'].toString().padLeft(2,'0') + ' - ' +
                                          data['closeh'].toString().padLeft(2,'0') + ':' + data['closem'].toString().padLeft(2,'0'),
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtRobotoRomanRegular15,),
                                ),
                                Align(alignment: Alignment.centerLeft,
                                  child: widget.services['sid'] == FirebaseAuth.instance.currentUser!.uid ?
                                    ElevatedButton.icon(
                                    onPressed: () {Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => EditServicePageOneScreen(services: widget.services)));},
                                    icon: Icon( // <-- Icon
                                      Icons.edit,
                                      color: ColorConstant.gray900,
                                      size: 11.0,
                                    ),
                                    label: Text('Edit Service',
                                      style: TextStyle(
                                        color: ColorConstant.gray900,
                                        fontSize: 11,
                                        fontFamily: 'Roboto',
                                      ),),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorConstant.gray600,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    ),// <-- Text
                                  ):
                                  SizedBox())
                              ],
                            ),

                            Container(
                              margin: getMargin(left: 28, top: 7, right: 26,),
                              padding: getPadding(left: 8, top: 7, bottom: 7,right: 8),
                                decoration: AppDecoration.txtFillWhiteA700
                                    .copyWith(
                                    borderRadius: BorderRadiusStyle
                                        .txtRoundedBorder6),
                                child: Text(data['location'] == '' ? 'Not yet set'
                                    : 'Location: ' + data['location'],
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanRegular15,),),
                            Container(
                              margin: getMargin(left: 28, top: 7, right: 30,),
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
                                    child: Padding(padding: getPadding(left: 7,right: 7, bottom: 2), child:OnlineWidget(sp:data),)),
                                ],
                              ),
                            ),
                            Container(
                                margin: getMargin(left: 28, top: 7, right: 26,),
                                padding: getPadding(left: 8, top: 7, bottom: 7,right: 8),
                                          decoration: AppDecoration.txtFillWhiteA700.copyWith(
                                              borderRadius: BorderRadiusStyle.txtRoundedBorder6),
                                          child: Text('Booking Price: RM ' + widget.services['price'].toString()+'.00',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtRobotoRomanRegular15)
                              ),
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
                                      Text("msg_service_description".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtRobotoRomanBold16WhiteA700),
                                      Container(
                                          constraints: BoxConstraints(
                                            minHeight: 70,
                                          ),
                                          width: double.infinity,
                                          margin: getMargin(top: 5),
                                          padding: getPadding(left: 8, top: 7, bottom: 7,right: 8),
                                          decoration: AppDecoration.fillWhiteA700.copyWith(
                                              borderRadius: BorderRadiusStyle.roundedBorder12),
                                          child: Text(widget.services['serdesc'],
                                                            maxLines: null,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtRobotoRomanRegular16)
                                    )])),
                            Padding(
                                padding:
                                getPadding(left: 28, top: 70, right: 28, bottom: 68),
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
                                                      SetAppointmentScreen(services: widget.services, sp: data)));},
                                          width: 150,
                                          text: "lbl_book_now".tr,
                                          variant: ButtonVariant.FillLightgreen800,
                                          shape: ButtonShape.RoundedBorder20),
                                      CustomButton(
                                          width: 150,
                                          onTap: (){Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SetAppointmentScreen(services: widget.services, sp: data)));},
                                          text: "lbl_book_later".tr,
                                          margin: getMargin(left: 9))
                                    ]))
                          ]),)
                ));
          }
          return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ));
        }
        );
    ;
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