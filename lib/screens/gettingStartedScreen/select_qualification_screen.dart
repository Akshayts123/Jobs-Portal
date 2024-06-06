import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/drop_down_widget.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/gettingStartedScreen/select_interested_job.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class SelectQualificationScreen extends StatelessWidget {
  static const String routeName = "selectQualificationScreen";
  SelectQualificationScreen({super.key});

  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: "15,15,15,15".padding(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: blackColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  reverse: true,
                  // shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        // header("Highest Qualification"),
                        const SizedBox(
                          height: 15,
                        ),
                        DropDownWidget(
                          bottomSheetTitle: "Highest Qualification",
                          subText: "Select a suitable field",
                          list: qualification,
                          value: _qualificationController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropDownWidget(
                          bottomSheetTitle: "Work Experience",
                          subText: "Select a suitable field",
                          list: wordExp,
                          value: _experienceController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        customButtonWidget(
                          context,
                          () {
                            Navigator.pushNamed(context, SelectJobOfInterestScreen.routeName);
                            // print(_mobileController.text);
                            print('get otp');
                          },
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: fontSize.bodyMedium(
                                  context,
                                  color: whiteColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: whiteColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
