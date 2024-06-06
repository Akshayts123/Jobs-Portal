import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/mainScreen/main_screen.dart';
import 'package:job_portal/utils/show_snackbar.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class SelectJobOfInterestScreen extends StatefulWidget {
  static const String routeName = "selectJobOfInterestScreen";
  SelectJobOfInterestScreen({super.key});

  @override
  State<SelectJobOfInterestScreen> createState() => _SelectJobOfInterestScreenState();
}

class _SelectJobOfInterestScreenState extends State<SelectJobOfInterestScreen> {
  final selectedJobsList = [];

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
              Text(
                "Select Job of your Interest.",
                style: fontSize.titleLarge(context),
              ),
              Text(
                "You can select upto 3 jobs.",
                style: fontSize.subtitle1(context),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: alljobs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: selectedJobsList.contains(alljobs[index]) ? redColor : whiteColor,
                      ),
                      child: ListTile(
                        onTap: () {
                          if (selectedJobsList.contains(alljobs[index])) {
                            setState(() {
                              selectedJobsList.remove(alljobs[index]);
                            });
                            return;
                          }
                          setState(() {
                            selectedJobsList.add(alljobs[index]);
                          });
                        },
                        leading: Image.asset(
                          "assets/icons/jobs/${allJobsImg[index]}",
                          height: 20,
                          width: 20,
                        ),
                        title: Text(
                          alljobs[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customButtonWidget(
                context,
                () {
                  if (selectedJobsList.isEmpty) {
                    showSnackBar(context, "Select atleast 1 job.");
                    return;
                  }
                  Navigator.pushNamed(context, MainScreen.routeName);
                  print('get otp');
                },
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get OTP",
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
        ),
      ),
    );
  }
}
