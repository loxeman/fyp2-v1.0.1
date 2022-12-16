import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/auth_handler.dart';
import 'package:fyp2/widgets/auth_widgets.dart';
import 'package:fyp2/widgets/snackbar.dart';
import 'controller/sign_up_page_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';
import 'package:fyp2/domain/googleauth/google_auth_helper.dart';
import 'package:fyp2/domain/facebookauth/facebook_auth_helper.dart';


// ignore_for_file: must_be_immutable
class SignUpPageCustomerScreen extends StatefulWidget {
  const SignUpPageCustomerScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPageCustomerScreen> createState() => _SignUpPageCustomerScreen();
}

class _SignUpPageCustomerScreen extends State<SignUpPageCustomerScreen> {

  final controller= Get.put(SignUpPageCustomerController());
  late String name;
  late String email;
  late String password;
  late String image;
  late String mobile;
  late String _uid;
  bool processing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = false;

  CollectionReference customers =
  FirebaseFirestore.instance.collection('customers');

  void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
        try {
          await AuthRepo.singUpWithEmailAndPassword(email, password);
          _uid = AuthRepo.uid;
          AuthRepo.updateUserName(name);
          await customers.doc(_uid).set({
            'name': name,
            'email': email,
            'image': image,
            'mobile': mobile,
            'address': '',
            'cid': _uid
          });
          _formKey.currentState!.reset();

          await Future.delayed(const Duration(microseconds: 100)).whenComplete(
                  () => Navigator.pushReplacementNamed(context, '/login_page_customer_screen'));
        } on FirebaseAuthException catch (e) {
          setState(() {
            processing = false;
          });
          MyMessageHandler.showSnackBar(_scaffoldKey, e.message.toString());
        }
    } else {
      setState(() {
        processing = false;
      });
      MyMessageHandler.showSnackBar(_scaffoldKey, 'please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray901,
            body: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 8, top: 9, right: 10),
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
                              padding: getPadding(left: 14, top: 27, right: 14),
                              child: Text("lbl_sign_up".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanBold34))),
                      CustomTextFormField(
                          width: 320,
                          focusNode: FocusNode(),
                          controller:
                              controller.textFieldOrdinaryInactiveController,
                          hintText: "lbl_name".tr,
                          margin: getMargin(left: 14, top: 73, right: 14),
                          variant: TextFormFieldVariant.OutlineBlack9000c,
                          shape: TextFormFieldShape.RoundedBorder4,
                          padding: TextFormFieldPadding.PaddingAll23,
                          fontStyle: TextFormFieldFontStyle.RobotoRomanMedium14,
                          alignment: Alignment.center,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your full name';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          }),
                      CustomTextFormField(
                          width: 320,
                          focusNode: FocusNode(),
                          controller:
                              controller.textFieldOrdinaryInactiveOneController,
                          hintText: "lbl_email".tr,
                          margin: getMargin(left: 14, top: 8, right: 14),
                          variant: TextFormFieldVariant.OutlineBlack9000c,
                          shape: TextFormFieldShape.RoundedBorder4,
                          padding: TextFormFieldPadding.PaddingAll23,
                          fontStyle: TextFormFieldFontStyle.RobotoRomanMedium14,
                          alignment: Alignment.center,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email ';
                            } else if (value.isValidEmail() == false) {
                              return 'invalid email';
                            } else if (value.isValidEmail() == true) {
                              return null;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          }),
                      CustomTextFormField(
                          width: 320,
                          focusNode: FocusNode(),
                          controller:
                              controller.textFieldOrdinaryInactiveTwoController,
                          hintText: "lbl_password".tr,
                          margin: getMargin(left: 14, top: 8, right: 14),
                          variant: TextFormFieldVariant.OutlineBlack9000c,
                          shape: TextFormFieldShape.RoundedBorder4,
                          padding: TextFormFieldPadding.PaddingAll23,
                          fontStyle: TextFormFieldFontStyle.RobotoRomanMedium14,
                          alignment: Alignment.center,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          isObscureText: true),
                      CustomTextFormField(
                          width: 320,
                          focusNode: FocusNode(),
                          controller: controller
                              .textFieldOrdinaryInactiveThreeController,
                          hintText: "lbl_mobile_number".tr,
                          margin: getMargin(left: 14, top: 8, right: 14),
                          variant: TextFormFieldVariant.OutlineBlack9000c,
                          shape: TextFormFieldShape.RoundedBorder4,
                          padding: TextFormFieldPadding.PaddingAll23,
                          fontStyle: TextFormFieldFontStyle.RobotoRomanMedium14,
                          textInputAction: TextInputAction.done,
                          alignment: Alignment.center,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your mobile number';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            mobile = value;
                          }),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: getPadding(left: 13, top: 9, right: 27),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 4, bottom: 2),
                                        child: TextButton(onPressed: () { Navigator.pushReplacementNamed(
                                            context, '/login_page_customer_screen'); },
                                        child: Text("msg_already_have_an".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanMedium14
                                                .copyWith(height: 1.21)))),
                                    Padding(
                                        padding: getPadding(left: 3),
                                        child: CommonImageView(
                                            svgPath: ImageConstant
                                                .imgArrowright24x24,
                                            height: getSize(24.00),
                                            width: getSize(24.00)))
                                  ]))),
                      CustomButton(
                          width: 200,
                          text: "lbl_sign_up2".tr,
                          margin: getMargin(left: 13, top: 31, right: 13),
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 13, top: 56, right: 13),
                              child: Text("msg_or_sign_up_with".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium14
                                      .copyWith(height: 1.21)))),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(
                                  left: 13, top: 12, right: 13, bottom: 57),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: EdgeInsets.all(0),
                                        color: ColorConstant.whiteA700,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25),
                                        child: Container(
                                            height: getVerticalSize(64.00),
                                            width: getHorizontalSize(92.00),
                                            decoration: AppDecoration
                                                .outlineBlack9000c
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder25),
                                            child: Stack(children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 34,
                                                          top: 20,
                                                          right: 34,
                                                          bottom: 20),
                                                      child: InkWell(
                                                          onTap: () {
                                                            onTapImgGoogle();
                                                          },
                                                          child: CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgGoogle,
                                                              height:
                                                                  getVerticalSize(
                                                                      24.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      23.00)))))
                                            ]))),
                                    Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: getMargin(left: 16),
                                        color: ColorConstant.whiteA700,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25),
                                        child: Container(
                                            height: getVerticalSize(64.00),
                                            width: getHorizontalSize(92.00),
                                            decoration: AppDecoration
                                                .outlineBlack9000c
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder25),
                                            child: Stack(children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 34,
                                                          top: 20,
                                                          right: 34,
                                                          bottom: 5),
                                                      child: InkWell(
                                                          onTap: () {
                                                            onTapImgFacebook();
                                                          },
                                                          child: CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgFacebook,
                                                              height: getSize(
                                                                  24.00),
                                                              width: getSize(
                                                                  24.00)))))
                                            ])))
                                  ])))
                    ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapImgGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapImgFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }
}
