import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/screens/notificationScreen/widgets/notification_card.dart';
import 'package:job_portal/utils/theme.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = "notificationScreen";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            children: [
              header("Latest Notifications"),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return NotificationCard();
                },
              ),
              header("Unseen Notifications"),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return NotificationCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
