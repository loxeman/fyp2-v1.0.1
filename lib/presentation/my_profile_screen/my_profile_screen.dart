import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/auth_handler.dart';
import 'package:fyp2/presentation/edit_profile_page_screen/edit_profile_page_screen.dart';
import 'package:fyp2/presentation/wallet_page_screen/wallet_page_screen.dart';
import 'package:fyp2/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

class MyProfileScreen extends StatefulWidget {
  /* final String documentId; */
  const MyProfileScreen({Key? key /* , required this.documentId */})
      : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State<MyProfileScreen> {
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
            backgroundColor: ColorConstant.gray901,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 9, top: 9, right: 10),
                          child: InkWell(
                              onTap: () {
                                onTapImgArrowleft();
                              },
                              child: CommonImageView(
                                  svgPath: ImageConstant.imgArrowleft,
                                  height: getSize(24.00),
                                  width: getSize(24.00))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 15, top: 26, right: 15),
                          child: Text("lbl_my_profile".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanBold34))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 23, top: 22, right: 23),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CommonImageView(
                                    imagePath: ImageConstant.imgUser2,
                                    height: getSize(63.00),
                                    width: getSize(63.00)),
                                Padding(
                                    padding: getPadding(
                                        left: 13, top: 10, bottom: 10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(right: 10),
                                              child: Text(data['name'] == ''
                                                  ? 'guest'.toUpperCase()
                                                  : data['name'].toUpperCase(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold18
                                                      .copyWith(height: 1.22))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: getPadding(
                                                      left: 1, top: 3),
                                                  child: Text(
                                                      data['email'] == ''
                                                          ? 'example@email.com'
                                                          : data['email'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtRobotoRomanMedium14Bluegray200
                                                          .copyWith(
                                                              height: 1.21))))
                                        ]))
                              ]))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 15, top: 46, right: 15),
                          child: Text("lbl_name".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoItalicThin16))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 16, top: 6, right: 16),
                          child: Text(data['name'] == ''
                              ? 'guest'.toUpperCase()
                              : data['name'].toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular11))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 14),
                          decoration: BoxDecoration(
                              color: ColorConstant.bluegray2005e))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 16, top: 16, right: 16),
                          child: Text("lbl_mobile_number".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoItalicThin16))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 16, top: 6, right: 16),
                          child: Text(data['phone'] == ''
                              ? 'example: +11111'
                              : data['mobile'],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular11))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 15),
                          decoration: BoxDecoration(
                              color: ColorConstant.bluegray2005e))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 15, top: 16, right: 7),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_wallet_balance".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtRobotoItalicThin16),
                                      Padding(
                                          padding:
                                              getPadding(top: 6, right: 10),
                                          child: Text(data['balance'] == ''
                                              ? 'RM 0.00'
                                              : data['balance'],
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanRegular11))
                                    ]),
                                Padding(
                                    padding: getPadding(top: 8, bottom: 5),
                                    child: InkWell(onTap: (){ Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WalletPageScreen()));},
                                    child: CommonImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightBluegray200,
                                        height: getSize(24.00),
                                        width: getSize(24.00))))
                              ]))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 15),
                          decoration: BoxDecoration(
                              color: ColorConstant.bluegray2005e))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 15, top: 17, right: 15),
                          child: Text("lbl_address".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoItalicThin16))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 16, top: 6, right: 16),
                          child: Text(data['address'] == ''
                              ? 'example: Gombak - USA'
                              : data['address'],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoRomanRegular11))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 14),
                          decoration: BoxDecoration(
                              color: ColorConstant.bluegray2005e))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 15, top: 20, right: 7),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(right: 10),
                                          child: Text("lbl_settings".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoItalicThin16)),
                                      Padding(
                                          padding: getPadding(top: 4),
                                          child: Text(
                                              "msg_edit_profile_password".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanRegular11))
                                    ]),
                                Padding(
                                    padding: getPadding(top: 3, bottom: 8),
                                    child: InkWell(onTap: (){ Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfilePageScreen())); },
                                    child: CommonImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightBluegray200,
                                        height: getSize(24.00),
                                        width: getSize(24.00))))
                              ]))),
                  CustomButton(
                      width: 200,
                      text: "lbl_log_out".tr,
                      margin:
                          getMargin(left: 15, top: 91, right: 15, bottom: 5),
                      variant: ButtonVariant.FillRed900,
                      alignment: Alignment.center,
                    onTap: () async {
                      MyAlertDilaog.showMyDialog(
                          context: context,
                          title: 'Log Out',
                          content:
                          'Are you sure to log out ?',
                          tabNo: () {
                            Navigator.pop(context);
                          },
                          tabYes: () async {
                            await AuthRepo.logOut();

                            await Future.delayed(
                                const Duration(
                                    microseconds:
                                    100))
                                .whenComplete(() {
                              Navigator.pop(context);
                              Navigator
                                  .pushReplacementNamed(
                                  context,
                                  '/initialRoute');
                            });
                          });
                    },
                  )
                ])
    );}
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.purple,
      ),
    );
    },
    );
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
