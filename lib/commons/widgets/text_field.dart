import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_portal/utils/theme.dart';

customTextField(
  TextEditingController controller, {
  double? width,
  double? height,
  String? labelText,
  String? hintText,
  int? maxLines,
  int? minLines,
  int? maxLength,
  bool? isRadius = true,
  bool? isShadow = true,
  bool islabel = false,
  List<TextInputFormatter>? formatter,
  TextInputType? textInputType,
}) =>
    Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 5,
      ),
      width: width ?? double.infinity,
      height: height == null ? null : 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: isRadius == true ? BorderRadius.circular(20) : null,
        color: whiteLight,
        boxShadow: isShadow == true
            ? [
                BoxShadow(
                  color: shadowGrey,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: TextField(
        autocorrect: false,
        enableSuggestions: false,
        style: const TextStyle(
          decoration: TextDecoration.none,
          color: blackColor,
        ),
        keyboardType: textInputType,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          counterText: "",
          floatingLabelBehavior:
              islabel == true ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
          // floatingLabelAlignment: FloatingLabelAlignment.start,
          labelText: labelText ?? 'Email',
          hintText: hintText ?? "example@gmail.com",
          hintStyle: const TextStyle(
            color: lightblackColor,
            decoration: TextDecoration.none,
          ),
          labelStyle: const TextStyle(
            color: lightblackColor,
            decoration: TextDecoration.none,
            fontSize: 14,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none, gapPadding: 0),
        ),
        // autocorrect: true,
        inputFormatters: formatter,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        maxLength: maxLength ?? 20,
        // onSubmitted: (e) {
        //   print(e);
        // },
      ),
    );
