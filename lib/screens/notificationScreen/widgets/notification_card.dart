import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/utils/theme.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      width: width(context),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New message from Google",
            style: fontSize.bodyMedium(
              context,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            " I tried to do this using widget with a flex value. But if I give flex.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: fontSize.bodyMedium(
              context,
              color: lightblackColor,
            ),
          ),
        ],
      ),
    );
  }
}
