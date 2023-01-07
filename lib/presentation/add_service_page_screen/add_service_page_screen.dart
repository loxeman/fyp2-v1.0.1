import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/widgets/alert_dialog.dart';
import 'package:fyp2/widgets/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/Tool/categ_list';


// ignore_for_file: must_be_immutable
class AddServicePageScreen extends StatefulWidget {

const AddServicePageScreen({Key? key}) : super(key: key);

@override
State<AddServicePageScreen> createState() => _AddServicePageScreen();
}

class _AddServicePageScreen extends State<AddServicePageScreen> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();

  late double price;
  late String serName;
  late String serDesc;
  late String serId;
  String mainCategValue = 'select category';
  String subCategValue = 'subcategory';
  List<String> subCategList = [];
  bool processing = false;

  final ImagePicker _picker = ImagePicker();

  List<XFile>? imagesFileList = [];
  List<String> imagesUrlList = [];
  dynamic _pickedImageError;

  void pickServiceImages() async {
    try {
      final pickedImages = await _picker.pickMultiImage(
          maxHeight: 300, maxWidth: 300, imageQuality: 95);
      setState(() {
        imagesFileList = pickedImages!;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);
    }
  }

  Widget previewImages() {
    if (imagesFileList!.isNotEmpty) {
      return SizedBox(
        height: 82,
        child: ListView.builder(
          shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
          itemCount: imagesFileList!.length,
          itemBuilder: (BuildContext context, int index) => Card(
            color: ColorConstant.gray900,
            child: Image.file(File(imagesFileList![index].path)),)));
    } else {
      return SizedBox(
        height: 82,
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Card(
                color: ColorConstant.gray900,
                child: CommonImageView(imagePath:ImageConstant.imgInsertpictureicon135x136, ),)));
    }
  }

  void selectedMainCateg(String? value) {
    if (value == 'select category') {
      subCategList = [];
    } else if (value == 'Plumber') {
      subCategList = Plumber;
    } else if (value == 'Technician') {
      subCategList = Technician;
    } else if (value == 'Electrician') {
      subCategList = Electrician;
    } else if (value == 'Home Cleaning') {
      subCategList = Cleaning;
    } else if (value == 'Gardener') {
      subCategList = Gardener;
    }
    print(value);
    setState(() {
      mainCategValue = value!;
      subCategValue = 'subcategory';
    });
  }

  Future<void> uploadImages() async {
    if (mainCategValue != 'select category' && subCategValue != 'subcategory') {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (imagesFileList!.isNotEmpty) {
          setState(() {
            processing = true;
          });
          try {
            for (var image in imagesFileList!) {
              firebase_storage.Reference ref = firebase_storage
                  .FirebaseStorage.instance
                  .ref('services/${path.basename(image.path)}');

              await ref.putFile(File(image.path)).whenComplete(() async {
                await ref.getDownloadURL().then((value) {
                  imagesUrlList.add(value);
                });
              });
            }
          } catch (e) {
            print(e);
          }
        } else {
          MyMessageHandler.showSnackBar(
              _scaffoldKey, 'please pick images first');
        }
      } else {
        MyMessageHandler.showSnackBar(_scaffoldKey, 'please fill all fields');
      }
    } else {
      MyMessageHandler.showSnackBar(_scaffoldKey, 'please select categories');
    }
  }

  void uploadData() async {
    if (imagesUrlList.isNotEmpty) {
      CollectionReference productRef =
      FirebaseFirestore.instance.collection('services');

      serId = const Uuid().v4();

      await productRef.doc(serId).set({
        'serid': serId,
        'maincateg': mainCategValue,
        'subcateg': subCategValue,
        'price': price,
        'sername': serName,
        'serdesc': serDesc,
        'sid': FirebaseAuth.instance.currentUser!.uid,
        'serimages': imagesUrlList,

      }).whenComplete(() {
        _formKey.currentState?.reset();
        setState(() {
          processing = false;
          imagesFileList = [];
          mainCategValue = 'select category';
          subCategList = [];
          imagesUrlList = [];
        });
        Navigator.pop(context, true);
        //   _formKey.currentState!.reset();
      });
    } else {
      print('no images');
    }
  }

  void uploadService() async {
    await uploadImages().whenComplete(() async => uploadData());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: AppBar(
              leading: AppBarBackButton(),
              centerTitle: true,
              title: AppBarTitle(title: 'Add Service'),
              backgroundColor: ColorConstant.gray900,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child:
                Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: getPadding(top:10),
                        child:
                        previewImages(),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child:
                        imagesFileList!.isEmpty ?
                        CustomButton(
                            width: 150,
                            text: "lbl_add_picture".tr,
                            margin: getMargin(top: 7,),
                            shape: ButtonShape.RoundedBorder20,
                            padding: ButtonPadding.PaddingAll12,
                            fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                            onTap: () {
                              pickServiceImages();},)
                        : CustomButton(
                            width: 150,
                            text: 'RESET PICTURE',
                            margin: getMargin(top: 7,),
                            variant: ButtonVariant.FillRed900,
                            shape: ButtonShape.RoundedBorder20,
                            padding: ButtonPadding.PaddingAll12,
                            fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                            onTap: () {
                              MyAlertDilaog.showMyDialog(
                                  context: context,
                                  title: 'Reset Picture',
                                  content:
                                  'Are you sure to reset the picture ?',
                                  tabNo: () {
                                Navigator.pop(context);
                              },
                              tabYes:(){
                              setState(() {
                                imagesFileList = [];
                              });
                              Navigator.pop(context);});
                            }),
                      ),
                      Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 320,
                                        margin: getMargin(top: 13,),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                        child: TextFormField(
                                            focusNode: FocusNode(),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'please enter service name';}
                                              return null;},
                                            onSaved: (value){
                                              serName=value!;},
                                            style: TextStyle(color: ColorConstant.gray800,
                                              fontSize: getFontSize(16,),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,),
                                            decoration: InputDecoration(
                                                labelText: 'Service Name',
                                                labelStyle: TextStyle(color: ColorConstant.gray800,
                                                  fontSize: getFontSize(12,),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,),
                                                hintText: 'Enter service name',
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 155,
                                      margin: getMargin(top: 13),
                                      padding: getPadding(left: 8),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                      child: DropdownButton(
                                          alignment: Alignment.center,
                                          isExpanded: true,
                                          style: TextStyle(
                                            color: ColorConstant.gray900,
                                            fontFamily: 'Roboto',
                                            fontSize: getFontSize(16),
                                          ),
                                          value: mainCategValue,
                                          items: maincateg.map<DropdownMenuItem<String>>((value)
                                          {
                                            return DropdownMenuItem(
                                              value:value,
                                              child: Text(value),
                                            );}).toList(),
                                          onChanged: (String? value) {
                                            selectedMainCateg(value);
                                          }
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      width: 155,
                                      margin: getMargin(top: 13,),
                                      padding: getPadding(left: 8),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                      child: DropdownButton(
                                          alignment: Alignment.center,
                                          disabledHint: const Text('select main category first'),
                                          isExpanded: true,
                                          style: TextStyle(
                                            color: ColorConstant.gray900,
                                            fontFamily: 'Roboto',
                                            fontSize: getFontSize(16),
                                          ),
                                          value: subCategValue,
                                          items: subCategList.map<DropdownMenuItem<String>>((value)
                                          {
                                            return DropdownMenuItem(
                                              value:value,
                                              child: Text(value),
                                            );}).toList(),
                                          onChanged: (String? value) {
                                            print(value);
                                            setState(() {
                                              subCategValue= value!;
                                            });
                                          }
                                      ),
                                    ),
                                  ],),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 320,
                                        margin: getMargin(top: 13,),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                        child: TextFormField(
                                            focusNode: FocusNode(),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'please enter price';
                                              } else if (value.isValidPrice() != true) {
                                                return 'invalid price';
                                              }
                                              return null;
                                            },
                                            onSaved: (value){
                                              price= double.parse(value!);},
                                            keyboardType:
                                            const TextInputType.numberWithOptions(
                                                decimal: true),
                                            style: TextStyle(color: ColorConstant.gray800,
                                              fontSize: getFontSize(16,),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,),
                                            decoration: InputDecoration(
                                                labelText: 'Booking Price',
                                                labelStyle: TextStyle(color: ColorConstant.gray800,
                                                  fontSize: getFontSize(12,),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,),
                                                hintText: 'Enter booking price',
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
                                        margin: getMargin(top: 13,),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                        child: TextFormField(
                                            maxLines: 10,
                                            minLines: 5,
                                            focusNode: FocusNode(),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'please enter service description';}
                                              return null;},
                                            onSaved: (value){
                                              serDesc= value!;},
                                            style: TextStyle(color: ColorConstant.gray800,
                                              fontSize: getFontSize(16,),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,),
                                            decoration: InputDecoration(
                                                labelText: 'Service Description',
                                                labelStyle: TextStyle(color: ColorConstant.gray800,
                                                  fontSize: getFontSize(12,),
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,),
                                                hintText: 'Enter service description',
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
                                processing == true ?
                                CustomButton(
                                      width: 163,
                                      text: 'Processing...',
                                      margin: getMargin(
                                          left: 10, top: 24, right: 10, bottom: 5),
                                      shape: ButtonShape.RoundedBorder20,
                                      variant: ButtonVariant.FillGray700,
                                      padding: ButtonPadding.PaddingAll12,
                                      fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                                      alignment: Alignment.center)
                                    : CustomButton(
                                    width: 163,
                                    text: "lbl_add_service3".tr,
                                    margin: getMargin(
                                        left: 10, top: 24, right: 10, bottom: 5),
                                    shape: ButtonShape.RoundedBorder20,
                                    padding: ButtonPadding.PaddingAll12,
                                    fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                                    alignment: Alignment.center,
                                    onTap: () {
                                      uploadService();},)
                              ])),
                    ]),
              )
            )
            ));
  }
}

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^((([1-9][0-9]*[\.]*)||([0][\.]*))([0-9]{1,2}))$')
        .hasMatch(this);
  }
}
