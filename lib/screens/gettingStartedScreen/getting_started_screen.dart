import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/screens/gettingStartedScreen/create_account_screen.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class GettingStartedScreen extends StatelessWidget {
  static const String routeName = "gettingStartedScreen";
  GettingStartedScreen({super.key});

  final TextEditingController _mobileController = TextEditingController();

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
                child: Text(
                  'LOGO',
                  style: fontSize.titleLarge(
                    context,
                    fontWeight: FontWeight.bold,
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
                        "left".align(
                          SizedBox(
                            width: width(context) * .7,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Land on your dream Job",
                                    style: fontSize.headline5(
                                      context,
                                      color: greyColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " with the highest salary",
                                    style: fontSize.headline5(
                                      context,
                                      color: blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        customTextField(
                          _mobileController,
                          labelText: "Mobile",
                          hintText: "",
                          textInputType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customButtonWidget(
                          context,
                          () {
                            Navigator.pushNamed(
                              context,
                              CreateAccountScreen.routeName,
                            );
                            print(_mobileController.text);
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
                          height: 50,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "By continuing you accept our ",
                                style: fontSize.titleMedium(
                                  context,
                                  color: greyColor,
                                ),
                              ),
                              TextSpan(
                                text: "privacy policy",
                                style: fontSize.underlineText(),
                              ),
                              TextSpan(
                                text: " and ",
                                style: fontSize.bodyMedium(
                                  context,
                                  color: greyColor,
                                ),
                              ),
                              TextSpan(
                                text: "terms of use",
                                style: fontSize.underlineText(),
                              ),
                            ],
                          ),
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
