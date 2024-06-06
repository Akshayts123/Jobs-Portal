import 'package:flutter/material.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

customButtonWidget(
  BuildContext context,
  Function function, {
  String? title,
  Widget? widget,
  Color? color,
  Color? textColor,
  double? width,
  double? height,
  double? fontSize,
  bool? isborder = false,
  FontWeight? fontWeight,
}) =>
    InkWell(
      onTap: () => function(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: isborder == false
              ? null
              : Border.all(
                  width: 1,
                  color: greyColor,
                ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: widget != null
            ? Center(child: widget)
            : 'center'.align(
                Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: textColor ?? whiteColor,
                        fontSize: fontSize ?? 16,
                        fontWeight: fontWeight ?? FontWeight.w500,
                      ),
                ),
              ),
      ),
    );
