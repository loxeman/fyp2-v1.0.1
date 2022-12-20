import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';
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
          .collection('customers')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      transaction.update(documentReference, {
        'fname': fname,
        'lname' : lname,
        'mobile': mobile,
        'address': address,
      });
    }).whenComplete(() {Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/my_profile_screen');
    });
  }

  saveChanges() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        processing = true;
      });
      await editProfileData();
      //Navigator.pop(context);
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
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding( top: 17),
                              child:
                              CircleAvatar(
                                radius: 31.5,
                                backgroundImage: NetworkImage(
                                    widget.data['image']),),)),
                        CustomButton(
                          width: 163,
                          text: "lbl_change_picture".tr,
                          margin: getMargin( top: 16, bottom: 12),
                          shape: ButtonShape.RoundedBorder20,
                          padding: ButtonPadding.PaddingAll12,
                          fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                          alignment: Alignment.center,
                          onTap: (){pickProfilePicture().whenComplete(() async =>
                          await uploadProfilePicture().whenComplete((){Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) =>
                              EditProfilePageScreen(data: widget.data)));
                          }));},),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 320,
                                margin: getMargin( top: 7),
                                child: TextFormField(
                                  initialValue: widget.data['fname'],
                                  focusNode: FocusNode(),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter valid text";}
                                    return null;},
                                  onSaved: (value) {
                                    fname = value!;},
                                  style: TextStyle(color: ColorConstant.gray800,
                                    fontSize: getFontSize(16,),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,),
                                  decoration: InputDecoration(
                                      labelText: 'First Name',
                                      labelStyle: TextStyle(color: ColorConstant.gray800,
                                        fontSize: getFontSize(12,),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,),
                                      hintText: widget.data['fname'],
                                      hintStyle: TextStyle(color: ColorConstant.gray800,
                                        fontSize: getFontSize(16,),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,),
                                      fillColor: ColorConstant.whiteA700,
                                      filled: true,
                                      border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)))))
                            )),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 320,
                                margin: getMargin( top: 7),
                                child: TextFormField(
                                    initialValue: widget.data['lname'],
                                    focusNode: FocusNode(),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter valid text";}
                                      return null;},
                                    onSaved: (value) {
                                      lname = value!;},
                                    style: TextStyle(color: ColorConstant.gray800,
                                      fontSize: getFontSize(16,),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,),
                                    decoration: InputDecoration(
                                        labelText: 'Last Name',
                                        labelStyle: TextStyle(color: ColorConstant.gray800,
                                          fontSize: getFontSize(12,),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,),
                                        hintText: widget.data['lname'],
                                        hintStyle: TextStyle(color: ColorConstant.gray800,
                                          fontSize: getFontSize(16,),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,),
                                        fillColor: ColorConstant.whiteA700,
                                      filled: true,
                                        border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.0))))
                                )
                            )),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 320,
                                margin: getMargin( top: 7),
                                child: TextFormField(
                                    initialValue: widget.data['address'],
                                    focusNode: FocusNode(),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter valid text";}
                                      return null;},
                                    onSaved: (value) {
                                      address = value!;},
                                    style: TextStyle(color: ColorConstant.gray800,
                                      fontSize: getFontSize(16,),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,),
                                    decoration: InputDecoration(
                                        labelText: 'Address',
                                        labelStyle: TextStyle(color: ColorConstant.gray800,
                                          fontSize: getFontSize(12,),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,),
                                        hintText: widget.data['address'] == '' ? 'No address' :  widget.data['address'],
                                        hintStyle: TextStyle(color: ColorConstant.gray800,
                                          fontSize: getFontSize(16,),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,),
                                        fillColor: ColorConstant.whiteA700,
                                      filled: true,
                                        border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.0))))
                                )
                            )),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 320,
                                margin: getMargin( top: 7),
                                child: TextFormField(
                                    initialValue: widget.data['mobile'],
                                    focusNode: FocusNode(),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter valid text";}
                                      return null;},
                                    onSaved: (value) {
                                      mobile = value!;},
                                    style: TextStyle(color: ColorConstant.gray800,
                                      fontSize: getFontSize(16,),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,),
                                    decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        labelStyle: TextStyle(color: ColorConstant.gray800,
                                          fontSize: getFontSize(12,),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,),
                                        hintText: widget.data['mobile'],
                                        hintStyle: TextStyle(color: ColorConstant.gray800,
                                          fontSize: getFontSize(16,),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,),
                                        fillColor: ColorConstant.whiteA700,
                                      filled: true,
                                        border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8.0))))
                                )
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(padding: getPadding(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  width: 140,
                                  text: "lbl_update".tr,
                                  margin: getMargin(
                                      top: 60, bottom: 5, right: 20),
                                  shape: ButtonShape.RoundedBorder20,
                                  padding: ButtonPadding.PaddingAll12,
                                  fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                                  alignment: Alignment.center,
                                  onTap: (){
                                    saveChanges();
                                  },),
                                CustomButton(
                                    width: 140,
                                    text: 'CANCEL',
                                    margin: getMargin(
                                        top: 60, bottom: 5),
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
