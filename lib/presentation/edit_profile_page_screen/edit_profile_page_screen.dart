import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/widgets/snackbar.dart';

import 'controller/edit_profile_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/core/utils/validation_functions.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


// ignore_for_file: must_be_immutable
class EditProfilePageScreen extends StatefulWidget {
final dynamic data;
const EditProfilePageScreen({Key? key, required this.data}) : super(key: key);

@override
State<EditProfilePageScreen> createState() => _EditProfilePageScreen();
}

class _EditProfilePageScreen extends State<EditProfilePageScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  TextEditingController textController = TextEditingController();
  XFile? imageFile;
  dynamic _pickedImageError;
  late String fname;
  late String lname;
  late String mobile;
  late String image;
  late String address;
  bool processing = false;

  final ImagePicker _picker = ImagePicker();

  pickProfilePicture() async {
    try {
      final pickedProfilePicture = await _picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      setState(() {
        imageFile = pickedProfilePicture;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);
    }
  }

  Future uploadProfilePicture() async {
    if (imageFile != null) {
      try {
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref('customer-image/${widget.data['email']}.jpg');

        await ref.putFile(File(imageFile!.path));

        image = await ref.getDownloadURL();
      } catch (e) {
        print(e);
      }
    } else {
      image = widget.data['image'];
    }
  }

  editProfileData() async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('suppliers')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      transaction.update(documentReference, {
        'fname': fname,
        'lname' : lname,
        'mobile': mobile,
        'image': image,
        'address': address,
      });
    }).whenComplete(() => Navigator.pop(context));
  }

  saveChanges() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        processing = true;
      });
      await uploadProfilePicture().whenComplete(() async => editProfileData());
      MyMessageHandler.showSnackBar(scaffoldKey, 'update completed');
      Navigator.pop(context);
    } else {
      MyMessageHandler.showSnackBar(scaffoldKey, 'please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: AppBar(backgroundColor: ColorConstant.gray900,
                            leading: AppBarBackButton(),
                            centerTitle: true,
                            title: AppBarTitle(
                              title: 'Edit Profile',
                            ),),
            body: SingleChildScrollView(
              child:Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(left: 14, top: 17, right: 14),
                              child:
                              widget.data['image'] == ''? CommonImageView(imagePath: ImageConstant.imgUser2,
                                  height: getSize(63.00),
                                  width: getSize(63.00))
                                  :  CircleAvatar(
                                radius: 31.5,
                                backgroundImage: NetworkImage(
                                    widget.data['image']),),)),
                        CustomButton(
                          width: 163,
                          text: "lbl_change_picture".tr,
                          margin: getMargin(left: 14, top: 16, right: 14),
                          shape: ButtonShape.RoundedBorder20,
                          padding: ButtonPadding.PaddingAll12,
                          fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                          alignment: Alignment.center,
                          onTap: (){pickProfilePicture();},),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: double.infinity,
                                margin: getMargin(left: 14, top: 19, right: 14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(8.00))),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 1, right: 10),
                                          child: Text('First Name',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanMedium12
                                                  .copyWith(
                                                  letterSpacing: 0.12))),
                                      CustomTextFormField(
                                        width: 319,
                                        focusNode: FocusNode(),
                                        controller: textController,
                                        hintText: widget.data['fname'],
                                        margin: getMargin(top: 5),
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          fname = value!;
                                        },
                                        initialValue: widget.data['fname'],)
                                    ]))),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: double.infinity,
                                margin: getMargin(left: 14, top: 7, right: 14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(8.00))),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 1, right: 10),
                                          child: Text('Last Name',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanMedium12
                                                  .copyWith(
                                                  letterSpacing: 0.12))),
                                      CustomTextFormField(
                                        width: 319,
                                        focusNode: FocusNode(),
                                        controller: textController,
                                        hintText: widget.data['lname'],
                                        margin: getMargin(top: 5),
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          fname = value!;
                                        },
                                        initialValue: widget.data['lname'],)
                                    ]))),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: double.infinity,
                                margin: getMargin(left: 14, top: 7, right: 14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(8.00))),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 1, right: 10),
                                          child: Text('Adress',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanMedium12
                                                  .copyWith(
                                                  letterSpacing: 0.12))),
                                      CustomTextFormField(
                                        width: 319,
                                        focusNode: FocusNode(),
                                        controller: textController,
                                        hintText: widget.data['address'] == ''
                                            ? 'example: Gombak - USA' : widget.data['address'],
                                        margin: getMargin(top: 5),
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          address = value!;
                                        },
                                        initialValue: widget.data['address'],)
                                    ]))),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: double.infinity,
                                margin: getMargin(left: 14, top: 9, right: 14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(8.00))),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 1, right: 10),
                                          child: Text("lbl_phone_number".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanMedium12
                                                  .copyWith(
                                                  letterSpacing: 0.12))),
                                      CustomTextFormField(
                                        width: 319,
                                        focusNode: FocusNode(),
                                        controller: textController,
                                        hintText: widget.data['mobile'],
                                        margin: getMargin(top: 5),
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          mobile = value!;
                                        },
                                        initialValue: widget.data['mobile'],)
                                    ]))),
                        Align(
                          child: Padding(padding: getPadding(),
                            child: Row(
                              children: [
                                CustomButton(
                                  width: 163,
                                  text: "lbl_update".tr,
                                  margin: getMargin(
                                      left: 14, top: 60, right: 14, bottom: 5),
                                  shape: ButtonShape.RoundedBorder20,
                                  padding: ButtonPadding.PaddingAll12,
                                  fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                                  alignment: Alignment.center,
                                  onTap: (){
                                    processing == true ? MyMessageHandler.showSnackBar(scaffoldKey, 'please wait..')
                                        : saveChanges();
                                  },),
                                CustomButton(
                                    width: 163,
                                    text: 'CANCEL',
                                    margin: getMargin(
                                        left: 14, top: 60, right: 14, bottom: 5),
                                    shape: ButtonShape.RoundedBorder20,
                                    variant: ButtonVariant.FillLightgreen800,
                                    padding: ButtonPadding.PaddingAll12,
                                    fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                                    alignment: Alignment.center,
                                    onTap:(){Navigator.pop(context);})
                              ],
                            ),),
                        )

                      ])),)
            ));
  }

}
