import 'package:flutter/material.dart';

final primaryColor = Color.fromARGB(255, 26, 115, 232);
final secondColor = Color.fromARGB(255, 251, 193, 18);
final primaryLight = Color.fromARGB(255, 129, 180, 255);
final secondLight = Color.fromARGB(255, 255, 221, 117);
final whiteLight = Colors.white54;

//first colors
// final primaryColor = Color.fromARGB(255, 225, 209, 255);
// final secondColor = Color.fromARGB(255, 190, 255, 235);

final blackColorLight = Color.fromARGB(17, 0, 0, 0);
const blackColor = Colors.black;
const lightblackColor = Colors.black54;
final greyColor = Colors.grey.shade400;
final shadowGrey = Color.fromARGB(255, 240, 240, 240);
const whiteColor = Colors.white;
const redColor = Color.fromARGB(255, 255, 193, 59);

//first gradient
// const appGradient = LinearGradient(
//   begin: Alignment.centerLeft,
//   end: Alignment.bottomRight,
//   colors: [
//     Color.fromARGB(255, 225, 209, 255),
//     Color.fromARGB(255, 190, 255, 235),
//   ],
// );
final appGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 169, 203, 255),
    Color.fromARGB(255, 252, 228, 156),
  ],
);

// final blackColor = Colors.black;

class fontSize {
  //body ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  static bodySmall(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.bodySmall?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static bodyMedium(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static bodyLarge(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.bodyLarge?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );

  //title ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  static titleSmall(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.titleSmall?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static titleMedium(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static titleLarge(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );

  //headlines ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  static headline1(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.headline1?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static headline2(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.headline2?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static headline3(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.headline3?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static headline4(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.headline4?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static headline5(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.headline5?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static headline6(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.headline6?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );

  //label ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  static labelSmall(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.labelSmall?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static labelMedium(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.labelMedium?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static labelLarge(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.labelLarge?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );

  //subtitles ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  static subtitle1(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.subtitle1?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
  static subtitle2(BuildContext context,
          {double? fontSize, FontWeight? fontWeight, Color? color, double? letterSpacing}) =>
      Theme.of(context).textTheme.subtitle2?.copyWith(
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          );

  //
  static underlineText([Color? color]) => TextStyle(
        color: color ?? blackColor,
        decoration: TextDecoration.underline,
      );
}
