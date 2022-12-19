import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/Tool/auth_handler.dart';

import 'controller/forget_password_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/core/utils/validation_functions.dart';
import 'package:fyp2/widgets/custom_button.dart';
import 'package:fyp2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgetPasswordPageScreen extends GetWidget<ForgetPasswordPageController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  TextEditingController textFieldOrdinaryActivatedController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: AppBar(backgroundColor: ColorConstant.gray900,
                            leading: AppBarBackButton(),),
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
                                padding: getPadding(left: 14, top: 26, right: 14),
                                child: Text("lbl_forget_password".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanBold34))),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: getHorizontalSize(248.00),
                                margin: getMargin(left: 14, top: 65, right: 14),
                                child: Text("msg_forgotten_your_password".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: AppStyle
                                        .txtRobotoRomanMedium14WhiteA700
                                        .copyWith(height: 1.43)))),
                        CustomTextFormField(
                            width: 320,
                            focusNode: FocusNode(),
                            controller: textFieldOrdinaryActivatedController,
                            hintText: "msg_enter_your_email".tr,
                            margin: getMargin(left: 14, top: 34, right: 14),
                            variant: TextFormFieldVariant.OutlineBlack9000c,
                            shape: TextFormFieldShape.RoundedBorder4,
                            padding: TextFormFieldPadding.PaddingAll23,
                            fontStyle: TextFormFieldFontStyle.RobotoRomanMedium14,
                            textInputAction: TextInputAction.done,
                            alignment: Alignment.center,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value, isRequired: true))) {
                                return "Please enter valid email";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            }),
                        CustomButton(
                          width: 200,
                          text: "lbl_forget_password2".tr,
                          margin: getMargin(
                              left: 14, top: 36, right: 14, bottom: 5),
                          alignment: Alignment.center,
                          onTap: () async {if (_formKey.currentState!.validate()) {
                            AuthRepo.sendPasswordResetEmail(email);
                          } else {
                            print('form not valid');
                          }},)
                      ])),)
            ));
  }

}
