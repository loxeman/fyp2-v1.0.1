import 'package:flutter/material.dart';
import 'package:fyp2/core/utils/size_utils.dart';
import 'package:fyp2/theme/app_style.dart';
import 'package:fyp2/widgets/auth_widgets.dart';

class RepeatedFieldEdit extends StatefulWidget {
  late String value;
  final String label;
  final String hint;

  RepeatedFieldEdit({Key? key, required this.value, required this.label, required this.hint}) : super(key: key);

  @override
  State<RepeatedFieldEdit> createState() => _RepeatedFieldEdit();
}

class _RepeatedFieldEdit extends State<RepeatedFieldEdit> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: 320,
            margin: getMargin( top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    getHorizontalSize(8.00))),
            child: TextFormField(
                    focusNode: FocusNode(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter valid text";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      widget.value = value!;
                    },
                    initialValue: widget.value,
                    decoration: textFormDecoration.copyWith(
                      labelText: widget.label, hintText: widget.hint),)
                ));
  }

}