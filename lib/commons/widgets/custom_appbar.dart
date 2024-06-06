import 'package:flutter/material.dart';
import 'package:job_portal/utils/theme.dart';

customAppBar(BuildContext context, [String? title]) {
  return AppBar(
    elevation: 0,
    backgroundColor: primaryLight,
    title: title != null ? Text(title) : null,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: blackColor,
      ),
    ),
    // title: title == null
    //     ? const SizedBox()
    //     : Text(
    //         title,
    //         style: fontSize.titleMedium(
    //           context,
    //           color: blackColor,
    //           // fontWeight: FontWeight.bold,
    //         ),
    //       ),
  );
}
