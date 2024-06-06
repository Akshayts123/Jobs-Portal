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
import 'package:job_portal/screens/gettingStartedScreen/select_qualification_screen.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class CreateAccountScreen extends HookWidget {
  static const String routeName = "createAccountScreen";
  CreateAccountScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final genderState = useState('');
    return Scaffold(
      body: SafeArea(
        child: "35,15,15,15".padding(
          ListView(
            reverse: true,
            // shrinkWrap: true,
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Account',
                        style: fontSize.headline6(
                          context,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Few more steps and you are good to go!.',
                        style: fontSize.titleLarge(
                          context,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  customTextField(
                    _nameController,
                    labelText: "Full Name",
                    hintText: "",
                  ),
                  header("Gender"),
                  SizedBox(
                    width: width(context),
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: gender.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Checkbox(
                                value: genderState.value == gender[index],
                                onChanged: (val) {
                                  genderState.value = gender[index];
                                },
                              ),
                              Text(
                                gender[index],
                              ),
                            ],
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customButtonWidget(
                    context,
                    () {
                      Navigator.pushNamed(context, SelectQualificationScreen.routeName);
                      print(_nameController.text);
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
      ),
    );
  }
}
