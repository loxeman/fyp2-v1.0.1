import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/presentation/navbar/navbar.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:uuid/uuid.dart';
import 'controller/set_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class SetAppointmentScreen extends StatefulWidget {

  final dynamic services;
  final dynamic sp;

  const SetAppointmentScreen({Key? key, required this.services, required this.sp}) : super(key: key);

  @override
  State<SetAppointmentScreen> createState() => _SetAppointmentScreen();
}

class _SetAppointmentScreen extends State<SetAppointmentScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(SetAppointmentController());
  DocumentReference customer =   FirebaseFirestore.instance.collection('customers').doc(FirebaseAuth.instance.currentUser!.uid);
  late String pickedtime;
  int _selectedRadio = 0;
  LatLng currLocation = LatLng(3.160936, 101.705967);
  late String location = '' ;
  String googleApikey = "AIzaSyDPlmBjDYleto--Pq9w_FCL42AT1Wb90nA";
  bool processing = false;
  late String cid;
  late String orderDesc;


  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedRadio = value!;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void uploadData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        processing = true;
      });

      CollectionReference productRef =
      FirebaseFirestore.instance.collection('order');

      String orderid = const Uuid().v4();

      await productRef.add({
        'orderid' : orderid,
        'cid': FirebaseAuth.instance.currentUser!.uid,
        'serid': widget.services['serid'],
        'orderdesc': orderDesc,
        'sid': widget.sp['sid'],
        'location': location,
        'status' : 'pending',
        'appointmrnt' : pickedtime

      }).whenComplete(() {
        _formKey.currentState?.reset();
        setState(() {
          processing = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NavbarCustomerPage(selectedindex: 0)));
        //   _formKey.currentState!.reset();
      });
    } else {
      print('no images');
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: customer.get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          else {
    Map<String, dynamic> data =
    snapshot.data!.data() as Map<String, dynamic>;
    return
      SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: AppBar(
              leading: AppBarBackButton(),
              title: AppBarTitle(title: 'Set Appointment'),
              centerTitle: true,
              backgroundColor: ColorConstant.gray900,
            ),
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 29, top: 20, right: 29),
                                child: Text("lbl_service_name".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanMedium12
                                        .copyWith(letterSpacing: 0.12)))),
                        Container(
                            width: 320,
                            margin: getMargin(left: 14, top: 4, right: 14),
                            padding: getPadding(left: 8, top: 10, bottom: 10,right: 8),
                            decoration: BoxDecoration(
                                color: ColorConstant.gray400,
                                borderRadius: BorderRadius.circular(getHorizontalSize(12.00))),
                            child: Text(widget.services['sername'],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                ) )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 28, top: 14, right: 28),
                                child: Text("msg_service_provider".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanMedium12
                                        .copyWith(letterSpacing: 0.12)))),
                        Container(
                          width: 320,
                          margin: getMargin(left: 14, top: 4, right: 14),
                          padding: getPadding(left: 8, top: 10, bottom: 10,right: 8),
                          decoration: BoxDecoration(
                              color: ColorConstant.gray400,
                              borderRadius: BorderRadius.circular(getHorizontalSize(12.00))),
                          child: Text(widget.sp['storename'],
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                              ) ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 28, top: 14, right: 28),
                                child: Text('Order Description',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanMedium12
                                        .copyWith(letterSpacing: 0.12)))),
                        Container(
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
                                    return 'please describe the service you want';}
                                  return null;},
                                onSaved: (value){
                                  orderDesc= value!;},
                                style: TextStyle(color: ColorConstant.gray800,
                                  fontSize: getFontSize(16,),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,),
                                decoration: InputDecoration(
                                    hintText: 'Describe the service you want',
                                    hintStyle: TextStyle(color: ColorConstant.gray800,
                                      fontSize: getFontSize(16,),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,),
                                    fillColor: ColorConstant.whiteA700,
                                    filled: true,
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0))))
                            )
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 28, top: 14, right: 28),
                                child: Text('Choose Appointment Time',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanMedium12.copyWith(letterSpacing: 0.12)))),
                        Container(
                            padding: getPadding(left: 8, top: 10, bottom: 10,right: 8),
                            margin: getMargin(left: 14, top: 4, right: 14),
                            width: 320,
                            decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(getHorizontalSize(12.00))),
                            child: DateTimePicker(
                              type: DateTimePickerType.dateTimeSeparate,
                              dateMask: 'd MMM, yyyy',
                              initialValue: DateTime.now().toString(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                              use24HourFormat: false,
                              icon: Icon(Icons.event),
                              dateLabelText: 'Date',
                              timeLabelText: "Hour",
                              onChanged: (val) => print(val),
                              validator: (val) {
                                print(val);
                                return null;
                              },
                              onSaved: (val) => pickedtime = val!,
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 28, top: 14, right: 28),
                                child: Text("lbl_meeting_option".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanMedium12
                                        .copyWith(letterSpacing: 0.12)))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 30, top: 4, right: 30),
                                child: ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      RadioListTile(
                                          value: 0,
                                          contentPadding: EdgeInsets.zero,
                                          dense: true,
                                          groupValue: _selectedRadio,
                                          onChanged: (int? value) => _handleRadioValueChanged(value),
                                          title: Transform.translate(offset: const Offset(-12,0),
                                              child: Text('Home Service',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Roboto')))),
                                      RadioListTile(
                                        value: 1,
                                        contentPadding: EdgeInsets.zero,
                                        dense: true,
                                        groupValue: _selectedRadio,
                                        onChanged: (int? value) => _handleRadioValueChanged(value),
                                        title: Transform.translate(offset: const Offset(-12,0),
                                          child: Text('Store walk in',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Roboto'),),),),
                                      RadioListTile(
                                        value: 2,
                                        contentPadding: EdgeInsets.zero,
                                        dense: true,
                                        groupValue: _selectedRadio,
                                        onChanged: (int? value) => _handleRadioValueChanged(value),
                                        title: Transform.translate(offset: const Offset(-12,0),
                                          child: Text('Other location',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Roboto'),),),)
                                    ]))),
                        _selectedRadio == 2 ?
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 28, top: 14, right: 28),
                                    child: Text("msg_meeting_location".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtRobotoRomanMedium12
                                            .copyWith(letterSpacing: 0.12)))),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: getVerticalSize(640.00),
                                    width: getHorizontalSize(320.00),
                                    margin: getMargin(left: 14, top: 4, right: 14),
                                    child: MapLocationPicker(
                                      apiKey: googleApikey,
                                      showBackButton: false,
                                      canPopOnNextButtonTaped: false,
                                      currentLatLng: currLocation,
                                      onNext: (GeocodingResult? result) {
                                        if (result != null) {
                                          setState(() {
                                            location = result.formattedAddress ?? "";
                                          });
                                        }
                                      },
                                      onSuggestionSelected: (PlacesDetailsResponse? result) {
                                        if (result != null) {
                                          setState(() {
                                            location =
                                                result.result.formattedAddress ?? "";
                                          });
                                        }
                                      },
                                    )))
                          ],
                        ) : SizedBox(),
                        data['balance'] >= widget.services['price'] ?
                        CustomButton(
                            width: 163,
                            text: "lbl_proceed".tr,
                            onTap: (){uploadData();},
                            margin: getMargin(
                                left: 14, top: 37, right: 14, bottom: 20),
                            shape: ButtonShape.RoundedBorder20,
                            padding: ButtonPadding.PaddingAll12,
                            fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                            alignment: Alignment.center)
                            :CustomButton(
                            width: 163,
                            text: 'Insufficient Balance',
                            margin: getMargin(
                                left: 14, top: 37, right: 14, bottom: 20),
                            shape: ButtonShape.RoundedBorder20,
                            variant: ButtonVariant.FillGray700,
                            padding: ButtonPadding.PaddingAll12,
                            fontStyle: ButtonFontStyle.RobotoRomanRegular16,
                            alignment: Alignment.center)
                      ])),
            )
            ));
  }});
 }
}
