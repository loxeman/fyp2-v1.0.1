import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/presentation/category_page_screen/category_page_screen.dart';
import 'package:fyp2/presentation/navbar/navbar.dart';
import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

class CustomerHomeScreen extends StatefulWidget {
  /* final String documentId; */
  const CustomerHomeScreen({Key? key /* , required this.documentId */})
      : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreen();
}

class _CustomerHomeScreen extends State<CustomerHomeScreen> {

  final controller=Get.put(CustomerHomeScreenController());
  TextEditingController languageOneController = TextEditingController();
  String? documentId;
  CollectionReference customers =
  FirebaseFirestore.instance.collection('customers');
  CollectionReference anonymous =
  FirebaseFirestore.instance.collection('anonymous');

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print(user.uid);
        setState(() {
          documentId = user.uid;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
    future: FirebaseAuth.instance.currentUser!.isAnonymous
    ? anonymous.doc(documentId).get()
        : customers.doc(documentId).get(),
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
    return /* Text("Full Name: ${data['full_name']} ${data['last_name']}"); */
         Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: CustomAppBar(
                height: getVerticalSize(90.00),
                title: Padding(
                    padding: getPadding(left: 44),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(right: 58, top: 30),
                                  child: Text("lbl_hello".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRubikRegular16
                                          .copyWith(height: 1.19)))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(),
                                  child: Text(data['fname'] == ''
                                      ? 'guest'.toUpperCase()
                                      : data['fname'].toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRubikBold32
                                          .copyWith(height: 1.19))))
                        ])),
                actions: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(left: 23, top: 22, right: 23),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                      data['image'] == ''?
                          CommonImageView(
                          imagePath: ImageConstant.imgUser2,
                          height: getSize(63.00),
                          width: getSize(63.00))
                          :  CircleAvatar(
                      radius: 31.5,
                      backgroundImage: NetworkImage(
                          data['image']),),])))
                ]),
            body: SingleChildScrollView(child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                      width: 320,
                      focusNode: FocusNode(),
                      controller: languageOneController,
                      hintText: "lbl_search_service".tr,
                      margin: getMargin(left: 28, top: 16, right: 27),
                      variant: TextFormFieldVariant.OutlineGray400,
                      shape: TextFormFieldShape.RoundedBorder12,
                      padding: TextFormFieldPadding.PaddingAll19,
                      fontStyle: TextFormFieldFontStyle.RubikRegular14,
                      textInputAction: TextInputAction.done,
                      suffix: Container(
                          margin: getMargin(
                              left: 30, top: 16, right: 16, bottom: 16),
                          child: CommonImageView(
                              svgPath: ImageConstant.imgRefresh)),
                      suffixConstraints: BoxConstraints(
                          minWidth: getHorizontalSize(24.00),
                          minHeight: getVerticalSize(24.00))),
                  Align(
                      child: Padding(
                          padding: getPadding(left: 52, top: 21, right: 52),
                          child: Text("msg_what_are_you_looking".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanMedium20
                                  .copyWith(height: 1.20)))),
                  Padding(
                      padding: getPadding(left: 28, top: 12, right: 27),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomButton(
                              width: 173,
                              text: "msg_fast_appointment".tr.toUpperCase(),
                              onTap: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NavbarCustomerPage(selectedindex: 1,)));},
                            ),
                            CustomButton(
                              width: 139,
                              text: "lbl_check_order".tr.toUpperCase(),
                              margin: getMargin(left: 6),
                              variant: ButtonVariant.FillLightgreen800,
                              onTap: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NavbarCustomerPage(selectedindex: 2,)));},)
                          ])),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 28, top: 17, right: 28),
                          child: Text("lbl_category".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRubikRegular14
                                  .copyWith(height: 1.21)))),
                  Padding(
                    padding: getPadding(left: 28, top: 10, right: 27),
                    child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 6,
                        padding: getPadding(left: 10,right: 10),
                        children: <Widget>[
                          RepeatedTile(label: 'Cleaning'.toUpperCase(), image: ImageConstant.img29298converted, iheight: 78, iwidth: 90),
                          RepeatedTile(label: 'Electrician'.toUpperCase(), image: ImageConstant.img40999converted, iheight: 78, iwidth: 66),
                          RepeatedTile(label: 'Plumber'.toUpperCase(), image: ImageConstant.img19191converted, iheight: 84, iwidth: 66),
                          RepeatedTile(label: 'Mechanic'.toUpperCase(), image: ImageConstant.img17205converted, iheight: 60, iwidth: 114),
                          RepeatedTile(label: 'Construction'.toUpperCase(), image: ImageConstant.img51384361, iheight: 80, iwidth: 114),
                          RepeatedTile(label: 'Logistic'.toUpperCase(), image: ImageConstant.imgLogisticworkers, iheight: 60, iwidth: 114)
                        ]
                    ),),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: getPadding(),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                    padding: getPadding(top: 5, bottom: 1),
                                    child: TextButton(onPressed: () { Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CategoryPageScreen())); },
                                        child: Text("lbl_more_category".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtRobotoRomanMedium14
                                                .copyWith(height: 1.21)))),
                                Padding(padding: getPadding(top: 5, bottom: 18, right: 10),
                                    child:CommonImageView(
                                        svgPath: ImageConstant.imgArrowright,
                                        height: getSize(24.00),
                                        width: getSize(24.00)))
                              ])))
                ]
            )));
    }return const Center(
      child: CircularProgressIndicator(
        color: Colors.purple,
      ),
    );
    },);
  }
}
