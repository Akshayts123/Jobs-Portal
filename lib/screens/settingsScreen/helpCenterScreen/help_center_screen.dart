import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class HelpCenterScreen extends StatelessWidget {
  static const String routeName = "HelpCenterScreen";
  HelpCenterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _probController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shadowGrey,
      appBar: customAppBar(context, "Help Center"),
      body: "15,15,15,15".padding(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                customTextField(
                  _emailController,
                  islabel: true,
                  labelText: "email",
                  hintText: "example@gmail.com",
                ),
                customTextField(
                  _subjectController,
                  islabel: true,
                  labelText: "Subject",
                  hintText: "",
                ),
                customTextField(
                  _probController,
                  islabel: true,
                  labelText: "Body",
                  // height: 250,
                  maxLines: 7,
                  minLines: 7,
                  maxLength: 350,
                  hintText: "",
                ),
              ],
            ),
            customButtonWidget(
              context,
              () {},
              title: "Send Message",
            ),
          ],
        ),
      ),
    );
  }
}
