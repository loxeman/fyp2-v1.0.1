import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_picker/day_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/widgets/alert_dialog.dart';
import 'package:fyp2/widgets/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'controller/edit_store_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

class EditStorePageScreen extends StatefulWidget {

  const EditStorePageScreen({Key? key,}) : super(key: key);

  @override
  State<EditStorePageScreen> createState() => _EditStorePageScreen();
}

class _EditStorePageScreen extends State<EditStorePageScreen> {

  CollectionReference services =
  FirebaseFirestore.instance.collection('service-provider');

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final controller=Get.put(EditStorePageController());
  XFile? imageFileLogo;
  XFile? imageFileCover;
  dynamic _pickedImageError;
  late String storename;
  late String location;
  late String mobile;
  late String storelogo;
  late String coverimage;
  late String desc;
  final ImagePicker _picker = ImagePicker();
  bool processing = false;

  late TimeOfDay? open = null;
  late TimeOfDay? close = null;
  late List<String> day = [''];
  int _selectedRadio = 0;

  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedRadio = value!;
    });
  }

  List<DayInWeek> _days = [
    DayInWeek("Sun",),
    DayInWeek("Mon",),
    DayInWeek("Tue",),
    DayInWeek("Wed",),
    DayInWeek("Thu",),
    DayInWeek("Fri",),
    DayInWeek("Sat",),
  ];
  

  pickStoreLogo() async {
    try {
      final pickedStoreLogo = await _picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      setState(() {
        imageFileLogo = pickedStoreLogo;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);
    }
  }

  pickCoverPicture() async {
    try {
      final pickedCoverPicture = await _picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      setState(() {
        imageFileCover = pickedCoverPicture;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);
    }
  }

  Future uploadStoreLogo(dynamic data) async {
    if (imageFileLogo != null) {
      try {
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref('service-provider-image/${data['email']}.jpg');

        await ref.putFile(File(imageFileLogo!.path));
        storelogo = await ref.getDownloadURL();
      } catch (e) {
        print(e);
      }
    } else {
      storelogo = data['storelogo'];
    }
  }

  Future uploadCoverImage(dynamic data) async {
    if (imageFileCover != null) {
      try {
        firebase_storage.Reference ref2 = firebase_storage
            .FirebaseStorage.instance
            .ref('service-provider-image/${data['email']}.jpg');

        await ref2.putFile(File(imageFileCover!.path));
        coverimage = await ref2.getDownloadURL();
      } catch (e) {
        print(e);
      }
    } else {
      coverimage = data['coverimage'];
    }
  }

  editStoreData(dynamic data) async {
    if(open == null) {open=TimeOfDay(hour: data['openh'], minute: data['openm']);
    if(close == null) {close=TimeOfDay(hour: data['closeh'], minute: data['closem']);}}
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('service-provider')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      transaction.update(documentReference, {
        'storename': storename,
        'location' : location,
        'mobile': mobile,
        'openh': open?.hour,
        'openm' : open?.minute,
        'closeh': close?.hour,
        'closem' : close?.minute,
        'day': day,
        'storelogo': storelogo,
        'coverimage': coverimage,
        'autostatus': _selectedRadio,
        'desc': desc,
      });
    }).whenComplete(() {
      _formKey.currentState?.reset();
      setState(() {
        processing = false;
        coverimage = '';
        storelogo = '';
        imageFileLogo = null;
        imageFileCover = null;
      });
      Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/navbarserviceprovider_screen');
    });
  }

  saveChanges(dynamic data) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        processing = true;
      });
      await uploadStoreLogo(data).whenComplete(() async =>
      await uploadCoverImage(data).whenComplete(() => editStoreData(data)));
      //Navigator.pop(context);
    } else {
      MyMessageHandler.showSnackBar(scaffoldKey, 'please fill all fields');
    }
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
        future: services.doc(FirebaseAuth.instance.currentUser!.uid).get(),
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
          child: ScaffoldMessenger(
              key: scaffoldKey,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: ColorConstant.gray900,
                    leading: const AppBarBackButton(),
                    centerTitle: true,
                    title: const AppBarTitle(title: 'Edit Store',),),
                  backgroundColor: ColorConstant.gray900,
                  body:  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 320,
                                    margin: getMargin(top: 17),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 4, color: ColorConstant.indigoA700),
                                                borderRadius: BorderRadius.circular(15)),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(11),
                                              child: imageFileLogo == null ? showImageStore(image: data['storelogo'])
                                                  : Image.file(File(imageFileLogo!.path) , fit: BoxFit.cover,),
                                            ),
                                          ),
                                          CustomButton(
                                            width: 211,
                                            text:
                                            "lbl_change_picture"
                                                .tr,
                                            margin: getMargin(top: 19, bottom: 19, left:10),
                                            shape: ButtonShape
                                                .RoundedBorder20,
                                            padding: ButtonPadding
                                                .PaddingAll12,
                                            fontStyle: ButtonFontStyle
                                                .RobotoRomanRegular16,
                                            onTap: (){pickStoreLogo();},)
                                        ]))),
                            SizedBox(height: 10,),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 320,
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize
                                            .min,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 4, color: ColorConstant.indigoA700),
                                                borderRadius: BorderRadius.circular(15)),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(11),
                                              child: imageFileCover == null ?
                                              showImageStore(image: data['coverimage'])
                                                  : Image.file(File(imageFileCover!.path) , fit: BoxFit.cover,),
                                            ),
                                          ) ,
                                          CustomButton(
                                            width: 211,
                                            text:
                                            "msg_change_cover_picture"
                                                .tr,
                                            margin: getMargin(
                                                top: 19,
                                                bottom: 19),
                                            shape: ButtonShape
                                                .RoundedBorder20,
                                            padding: ButtonPadding
                                                .PaddingAll12,
                                            fontStyle: ButtonFontStyle
                                                .RobotoRomanRegular16,
                                            onTap: (){pickCoverPicture();},)
                                        ]))),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 320,
                                    margin: getMargin(top: 13,),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                    child: TextFormField(
                                        initialValue: data['storename'],
                                        focusNode: FocusNode(),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter valid text";}
                                          return null;},
                                        onSaved: (value){
                                          storename=value!;},
                                        style: TextStyle(color: ColorConstant.gray800,
                                          fontSize: getFontSize(16,),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,),
                                        decoration: InputDecoration(
                                            labelText: 'Store Name',
                                            labelStyle: TextStyle(color: ColorConstant.gray800,
                                              fontSize: getFontSize(12,),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,),
                                            hintText: data['storename'],
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
                                        initialValue: data['location'],
                                        focusNode: FocusNode(),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter valid text";}
                                          return null;},
                                        onSaved: (value){
                                          location=value!;},
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
                                            hintText: data['location'] == '' ? 'Not yet set' : data['location'],
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
                                        initialValue: data['mobile'],
                                        focusNode: FocusNode(),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter valid text";}
                                          return null;},
                                        onSaved: (value){
                                          mobile=value!;},
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
                                            hintText: data['mobile'],
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
                            Container(
                              width: 320,
                              margin: getMargin(top: 13,),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 155,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text('Open Time',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 12,
                                              color: Colors.white,
                                            )),
                                        ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorConstant.indigoA700,
                                            ),
                                            onPressed: () async {
                                              open = await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              );
                                              setState(() {});
                                            },
                                            icon: Icon(Icons.access_time_filled),
                                            label: open == null ? Text(data['openh'].toString().padLeft(2,'0')+':'+data['openm'].toString().padLeft(2,'0'))
                                                : Text('${open?.hour.toString().padLeft(2,'0')}' + ':' + '${open?.minute.toString().padLeft(2,'0')}'))
                                      ],
                                    ),
                                  ),//open Time
                                  SizedBox(width: 10,),
                                  Container(
                                      width: 155,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                      child: Column(
                                        children: [
                                          Text('Close Time',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 12,
                                                color: Colors.white,)),
                                          ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: ColorConstant.indigoA700,
                                              ),
                                              onPressed: () async {
                                                close = await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now(),
                                                );
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.access_time_filled),
                                              label: close == null ? Text(data['closeh'].toString().padLeft(2,'0')+':'+data['closem'].toString().padLeft(2,'0'))
                                                  : Text('${close?.hour.toString().padLeft(2,'0')}' + ':' + '${close?.minute.toString().padLeft(2,'0')}')),
                                        ],
                                      )

                                  ),//close Time
                                ],),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 320,
                                    margin: getMargin(top: 13,),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(getHorizontalSize(8.00)),
                                        color:ColorConstant.whiteA700 ),
                                    child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding( padding: getPadding(top:6, left:6),
                                              child: Text('Operation Day',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 10,)),)),
                                        SelectWeekDays(
                                          fontSize:12,
                                          fontWeight: FontWeight.w500,
                                          selectedDayTextColor: ColorConstant.whiteA700,
                                          unSelectedDayTextColor: ColorConstant.gray900,
                                          days: _days,
                                          daysFillColor: ColorConstant.indigoA700,
                                          border: false,
                                          boxDecoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: ColorConstant.whiteA700
                                          ),
                                          onSelect: (values) { // <== Callback to handle the selected days
                                            print(values);
                                            day = values!;
                                          },
                                        ),
                                      ],
                                    )

                                )),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 320,
                                    margin: getMargin(top: 13,),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(getHorizontalSize(8.00)),
                                        color: ColorConstant.whiteA700),
                                    child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding( padding: getPadding(top:6, left:6),
                                                child: Text('Auto Availability Option',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 10,)),)),
                                          RadioListTile(
                                            value: 0,
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            groupValue: _selectedRadio,
                                            onChanged: (int? value) {
                                              ConfirmAlertDialog.showMyDialog(context: context,
                                                  title: 'Default',
                                                  content: 'Your availability will show online when it your operation hour and you open the application or running the application in the background. You will offline when its your off day or you logout or the application is killed',
                                                  tabNo: () {
                                                    Navigator.pop(context);
                                                  },
                                                  tabYes: () {
                                                    _handleRadioValueChanged(value);
                                                    Navigator.pop(context);
                                                  });},
                                            title: Transform.translate(offset: const Offset(-12,0),
                                              child: Text('Default',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Roboto'),),),),
                                          RadioListTile(
                                              value: 1,
                                              contentPadding: EdgeInsets.zero,
                                              dense: true,
                                              groupValue: _selectedRadio,
                                              onChanged: (int? value) {
                                                ConfirmAlertDialog.showMyDialog(context: context,
                                                    title: 'Stay online when connected',
                                                    content: 'Your availability will show online when you open the application or running the application in the background. You will offline when you logout or the application is killed',
                                                    tabNo: () {
                                                      Navigator.pop(context);
                                                    },
                                                    tabYes: () {
                                                      _handleRadioValueChanged(value);
                                                      Navigator.pop(context);
                                                    });},
                                              title: Transform.translate(offset: const Offset(-12,0),
                                                  child: Text('Stay online when connected',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: 'Roboto')))),
                                          RadioListTile(
                                            value: 2,
                                            contentPadding: EdgeInsets.zero,
                                            dense: true,
                                            groupValue: _selectedRadio,
                                            onChanged: (int? value) {
                                              ConfirmAlertDialog.showMyDialog(context: context,
                                                  title: 'Manual status',
                                                  content: 'You have to configure your availability by yourself using the button at the homescreen',
                                                  tabNo: () {
                                                    Navigator.pop(context);
                                                  },
                                                  tabYes: () {
                                                    _handleRadioValueChanged(value);
                                                    Navigator.pop(context);
                                                  });},
                                            title: Transform.translate(offset: const Offset(-12,0),
                                              child: Text('Manual status',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Roboto'),),),),
                                        ]))),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 320,
                                    margin: getMargin(top: 13,),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                    child: TextFormField(
                                        initialValue: data['desc'],
                                        focusNode: FocusNode(),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter valid text";}
                                          return null;},
                                        onSaved: (value){
                                          desc=value!;},
                                        maxLines: 10,
                                        minLines: 5,
                                        style: TextStyle(color: ColorConstant.gray800,
                                          fontSize: getFontSize(16,),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,),
                                        decoration: InputDecoration(
                                            labelText: 'Store Description',
                                            labelStyle: TextStyle(color: ColorConstant.gray800,
                                              fontSize: getFontSize(12,),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,),
                                            hintText: data['desc'] == '' ? 'Not yet set' : data['desc'],
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
                                        if(day[0]=='') {MyMessageHandler.showSnackBar(scaffoldKey, 'please select operation day!');}
                                        else saveChanges(data);
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
                            ),
                            SizedBox(height: 50,)
                          ])  ,)

                    ,

                  )))
        );}
          return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ));}


    );
  }
}

  onTapImgArrowleft() {
    Get.back();
  }

class showImageStore extends StatelessWidget{
  final String image;
  showImageStore({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image == ''){
      return CommonImageView(
          imagePath: ImageConstant.imgInsertpictureicon135x136,
          fit: BoxFit.contain,);
    }
    else{
      return Image.network( image,
          fit: BoxFit.cover,);
    }
  }
}


