import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/round_bg_widget.dart';
import 'package:job_portal/utils/theme.dart';

customDrawerTile(
  BuildContext context, {
  required String title,
  Widget? trainling,
  IconData? icon,
  required Function function,
  String? subtitles,
}) =>
    ListTile(
      onTap: () => function(),
      leading: icon == null
          ? null
          : customCircleBgWidget(
              child: Icon(
                icon,
                color: whiteColor,
                size: 20,
              ),
            ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: primaryColor,
            ),
      ),
      subtitle: subtitles == null
          ? null
          : Text(
              subtitles,
            ),
      trailing: trainling,
    );

lightCustomDrawerWidget(
  BuildContext context, {
  required String title,
  required Function function,
}) =>
    InkWell(
      onTap: () => function(),
      child: Container(
        width: width(context),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: primaryColor,
                  ),
            ),
            const Icon(
              Icons.arrow_forward,
              size: 16,
              color: lightblackColor,
            ),
          ],
        ),
      ),
    );
