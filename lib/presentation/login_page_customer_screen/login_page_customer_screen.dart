
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/Tool/auth_handler.dart';
import 'package:fyp2/presentation/forget_password_page_screen/forget_password_page_screen.dart';
import 'package:fyp2/presentation/sign_up_page_customer_screen/sign_up_page_customer_screen.dart';
import 'package:fyp2/widgets/auth_widgets.dart';
import 'package:fyp2/widgets/snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'controller/login_page_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/core/utils/validation_functions.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';
import 'package:fyp2/domain/facebookauth/facebook_auth_helper.dart';

class LoginPageCustomerScreen extends StatefulWidget{
  const LoginPageCustomerScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageCustomerScreen> createState() => _LoginPageCustomerScreen();
}

class _LoginPageCustomerScreen extends State<LoginPageCustomerScreen>{

  final controller = Get.put(LoginPageCustomerController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference customers =
  FirebaseFirestore.instance.collection('customers');

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await customers.doc(docId).get();
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  bool docExists = false;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() async {
      User user = FirebaseAuth.instance.currentUser!;
      print(googleUser!.id);
      print(FirebaseAuth.instance.currentUser!.uid);
      print(googleUser);
      print(user);

      docExists = await checkIfDocExists(user.uid);

      docExists == false
          ? await customers.doc(user.uid).set({
        'fname': user.displayName,
        'email': user.email,
        'image': user.photoURL,
        'mobile': '',
        'address': '',
        'cid': user.uid
      }).then((value) => navigate())
          : navigate();
    });
  }

  late String email;
  late String password;
  bool processing = false;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = true;

  void navigate() {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/navbarcustomer_screen');
  }

  void logIn() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await AuthRepo.signInWithEmailAndPassword(email, password);

        await AuthRepo.reloadUserData();
        if (await AuthRepo.checkEmailVerification()) {
          _formKey.currentState!.reset();
          navigate();
        } else {
          MyMessageHandler.showSnackBar(
              _scaffoldKey, 'please check your inbox');
          setState(() {
            processing = false;
          });
        }
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
            backgroundColor: ColorConstant.gray900,
            appBar: AppBar(backgroundColor: ColorConstant.gray900,
                            leading: AppBarBackButton(),),
            body: SingleChildScrollView(
                child:Form(
                key: _formKey,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 14, top: 27, right: 14),
                              child: Text("lbl_login".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanBold34))),
                      CustomTextFormField(
                        width: 320,
                        focusNode: FocusNode(),
                        controller:
                        controller.textFieldOrdinaryInactiveController,
                        hintText: "lbl_email".tr,
                        margin: getMargin(left: 14, top: 73, right: 14),
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
                        },),
                      CustomTextFormField(
                          width: 320,
                          focusNode: FocusNode(),
                          controller:
                          controller.textFieldOrdinaryInactiveOneController,
                          hintText: "lbl_password".tr,
                          margin: getMargin(left: 14, top: 8, right: 14),
                          variant: TextFormFieldVariant.OutlineBlack9000c,
                          shape: TextFormFieldShape.RoundedBorder4,
                          padding: TextFormFieldPadding.PaddingAll23,
                          fontStyle: TextFormFieldFontStyle.RobotoRomanMedium14,
                          textInputAction: TextInputAction.done,
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
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: getPadding(left: 39, top: 14, right: 39),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                        padding: getPadding(),
                                        child: TextButton(onPressed: (){Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgetPasswordPageScreen()));},
                                            child: Text("msg_forget_your_password".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.
                                            txtRobotoRomanMedium14
                                                .copyWith(height: 1.21)))
                                    ),
                                    Padding(
                                        padding: getPadding(top: 10),
                                        child: InkWell(onTap: (){Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgetPasswordPageScreen()));},
                                            child: CommonImageView(
                                                svgPath: ImageConstant.imgArrowright,
                                                height: getSize(50.00),
                                                width: getSize(40.00)))
                                    )
                                  ]))),
                      CustomButton(
                        width: 200,
                        text: "lbl_login2".tr,
                        margin: getMargin(left: 14, top: 30, right: 14),
                        alignment: Alignment.center,
                        onTap: () {
                          logIn();
                        },),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding:
                              getPadding(left: 14, top: 40, right: 14),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 1),
                                        child: Text("msg_are_you_new_here".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanMedium20
                                                .copyWith(height: 1.20))),
                                    Padding(
                                        padding: getPadding(left: 2, top: 1),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignUpPageCustomerScreen()));
                                            },
                                            child: Text("lbl_sign_up3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanMedium20IndigoA700
                                                    .copyWith(height: 1.20))))
                                  ]))),
                      /*Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 14, top: 40, right: 14),
                              child: Text("msg_or_login_with_social".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanMedium14
                                      .copyWith(height: 1.21)))),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(
                                  left: 14, top: 12, right: 14, bottom: 57),
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
                                                            signInWithGoogle();
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
                                  ])))*/
                    ])))
            ));
  }

  onTapImgFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

}
// ignore_for_file: must_be_immutable
