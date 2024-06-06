import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/commons/widgets/header.dart';

class GeneralSettings extends HookWidget {
  static const String routeName = 'general_settings';
  const GeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationToggle = useState(false);
    return Scaffold(
      appBar: customAppBar(context),
      body: Container(
        child: Column(
          children: [
            header("General"),
            SwitchListTile(
              value: notificationToggle.value,
              onChanged: (val) {
                notificationToggle.value = val;
              },
              title: Text("Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
