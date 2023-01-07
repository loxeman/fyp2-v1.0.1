import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/Tool/categ_list';
import 'package:fyp2/main.dart';
import 'package:fyp2/widgets/alert_dialog.dart';
import 'package:fyp2/widgets/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class EditServicePageOneScreen extends StatefulWidget {
final dynamic services;
const EditServicePageOneScreen({Key? key, required this.services}) : super(key: key);

@override
State<EditServicePageOneScreen> createState() => _EditStorePageScreen();
}

class _EditStorePageScreen extends State<EditServicePageOneScreen> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();

  late double price;
  late String serName;
  late String serDesc;
  late String serId;
  late String mainCategValue = widget.services['maincateg'];
  late String subCategValue = widget.services['subcateg'];
  List<String> subCategList = [];
  late List<dynamic> currimage = widget.services['serimages'];
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
    }else {
      return SizedBox(
          height: 82,
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currimage.length,
              itemBuilder: (BuildContext context, int index) => Card(
                color: ColorConstant.gray900,
                child: Image.network(currimage[index]),)));
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
          imagesUrlList = widget.services['serimages'];
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
      serId = const Uuid().v4();

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentReference documentReference = FirebaseFirestore.instance
            .collection('services')
            .doc(widget.services['serid']);
        transaction.update(documentReference, {
        'serid': serId,
        'maincateg': mainCategValue,
        'subcateg': subCategValue,
        'price': price,
        'sername': serName,
        'serdesc': serDesc,
        'sid': FirebaseAuth.instance.currentUser!.uid,
        'serimages': imagesUrlList,
        });
      }).whenComplete(() {
        setState(() {
          processing = false;
          imagesFileList = [];
          mainCategValue = 'select category';
          subCategList = [];
          imagesUrlList = [];
          _formKey.currentState?.reset();
        });
        Navigator.pop(context);
        //   _formKey.currentState!.reset();
      });
    } else {
      print('no images');
    }
  }

  void uploadService() async {
    await uploadImages().whenComplete(() => uploadData());
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
              title: AppBarTitle(title: 'Edit Service'),
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
                            text: 'REPLACE PICTURE',
                            margin: getMargin(top: 7,),
                            variant: ButtonVariant.FillRed900,
                            shape: ButtonShape.RoundedBorder20,
                            padding: ButtonPadding.PaddingAll12,
                            fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                            onTap: () {
                            MyAlertDilaog.showMyDialog(
                            context: context,
                            title: 'Replace Picture',
                            content:
                            'Are you sure to replace the picture ?',
                            tabNo: () {
                              Navigator.pop(context);
                            },
                            tabYes:(){
                              pickServiceImages();;});
                              },)
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
                                            initialValue: widget.services['sername'],
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
                                              initialValue: widget.services['price'],
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
                                              initialValue: widget.services['serdesc'],
                                              maxLines: 10,
                                              minLines: 5,
                                              focusNode: FocusNode(),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'please enter service description';}
                                                return null;},
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
                                  CustomButton(
                                      width: 163,
                                      text: 'UPDATE',
                                      margin: getMargin(
                                          left: 10, top: 24, right: 10, bottom: 5),
                                      shape: ButtonShape.RoundedBorder20,
                                      padding: ButtonPadding.PaddingAll12,
                                      fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                                      alignment: Alignment.center)
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
