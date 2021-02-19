import 'package:expense_movie_tracker/utils/app_colors.dart';
import 'package:expense_movie_tracker/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final Function editingComplete;
  final Function onValidate;
  final Function onSaved;
  final bool obscure;
  // final TextInputFormatter formatter;
  final String fieldName;
  final bool isAutoFocus;
  final TextInputType inputType;
  final TextEditingController controller;
  final int maxLines;
  final double padding;
  final String hintText;
  final Widget suffixWidget;
  final Widget prefixWidget;
  final Function onTap;
  final bool readOnly;
  final Widget suffixIcon;
  final Widget prefixIcon;

  const CustomTextField({
    Key key,
    this.editingComplete,
    this.fieldName,
    this.isAutoFocus,
    this.onSaved,
    this.inputType,
    this.onValidate,
    this.controller,
    this.maxLines = 1,
    this.padding,
    this.hintText,
    this.suffixWidget,
    this.prefixWidget,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.obscure = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kBottomFieldTitlePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          kSizedBoxH5,
          TextFormField(
            obscureText: obscure,
            maxLines: maxLines,
            readOnly: readOnly,
            // inputFormatters: [formatter],
            controller: controller,
            validator: onValidate,
            keyboardType: inputType,
            onSaved: onSaved,
            onEditingComplete: editingComplete,
            onTap: onTap,
            decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(
                maxHeight: 25, //25
                minHeight: 10,
                minWidth: 25,
              ),
              suffixIconConstraints: BoxConstraints(
                maxHeight: 25,
                minHeight: 25,
                minWidth: 25,
              ),
              suffix: suffixWidget != null ? suffixWidget : null,
              prefix: prefixWidget != null ? prefixWidget : null,
              // prefixText: "2344",
              // suffix:suffixWidget != null ? suffixWidget : null ,
              //  prefix: prefixWidget != null ? prefixWidget : null,
              suffixIcon: suffixIcon != null ? suffixIcon : null,
              prefixIcon: prefixIcon != null ? prefixIcon : null,
              hintStyle: TextStyle(fontSize: 13),
              hintText: hintText == null ? fieldName : hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kColorDark),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kColorGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kColorGrey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
