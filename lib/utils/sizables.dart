import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension CustomSize on int {
  Widget get width => SizedBox(width: this.toDouble());
  Widget get height => SizedBox(height: this.toDouble());
  // double get height => customSizedHeight(this);
}

extension CustomAlign on String {
  Widget align(Widget child) => Align(
        alignment: this == 'left'
            ? Alignment.centerLeft
            : this == 'center'
                ? Alignment.center
                : Alignment.bottomRight,
        child: child,
      );
}

extension CustomPadding on String {
  Widget padding(Widget child) {
    final sep = this.split(',');
    if (sep.length == 4) {
      return customPadding(double.parse(sep[0]), double.parse(sep[1]), double.parse(sep[2]),
          double.parse(sep[3]), child);
    } else if (sep.length == 3) {
      return customPadding(
          double.parse(sep[0]), double.parse(sep[1]), double.parse(sep[2]), 0, child);
    } else if (sep.length == 2) {
      return customPadding(double.parse(sep[0]), double.parse(sep[1]), 0, 0, child);
    } else if (sep.length == 1) {
      return customPadding(double.parse(sep[0]), double.parse(sep[0]), double.parse(sep[0]),
          double.parse(sep[0]), child);
    } else {
      return const SizedBox();
    }
  }
  // return SizedBox();
}

customPadding(t, b, l, r, child) {
  return Padding(
    padding: EdgeInsets.only(
      top: t ?? 0,
      bottom: b ?? 0,
      left: l ?? 0,
      right: r ?? 0,
    ),
    child: child,
  );
}
