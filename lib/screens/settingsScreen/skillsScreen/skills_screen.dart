import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/filterPopUp/filter_popup.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class SkillsScreen extends StatefulWidget {
  static const String routeName = 'skills_screen';
  SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final selectedSkills = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: customAppBar(context, "Personal Info"),
        body: "15,15,15,15".padding(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  header("Personal Skills"),
                  Autocomplete(
                    onSelected: (option) {
                      setState(() {
                        selectedSkills.add(option);
                      });
                      print(option);
                    },
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text == '') {
                        return personalSkills;
                      } else {
                        return personalSkills.where((element) {
                          return element.contains(textEditingValue.text);
                        });
                      }
                    },
                    fieldViewBuilder:
                        (context, textEditingController, focusNode, onFieldSubmitted) {
                      return Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: TextField(
                          focusNode: focusNode,
                          controller: textEditingController,
                          // onChanged: (value) {
                          //   onFieldSubmitted();
                          // },
                          onEditingComplete: () {
                            onFieldSubmitted();
                          },
                          onSubmitted: (val) {
                            textEditingController.clear();
                          },
                          autocorrect: false,
                          enableSuggestions: false,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                          ),
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Select your education",
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      );
                    },
                  ),
                  Wrap(
                    children: List.generate(
                      selectedSkills.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: shadowGrey,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        // width: 70,
                        // height: 30,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              selectedSkills[index],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  // final isit =
                                  //     addedCompanies.contains(addedCompanies[index]);
                                  // if (isit) {
                                  setState(() {
                                    selectedSkills.remove(selectedSkills[index]);
                                  });
                                  // }
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              customButtonWidget(
                context,
                height: 50,
                isborder: true,
                // color: whiteColor,
                () {
                  print('save');
                },
                title: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
