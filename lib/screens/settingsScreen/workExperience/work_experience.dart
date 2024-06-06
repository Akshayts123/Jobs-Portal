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
import 'package:job_portal/utils/show_snackbar.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class WorkExperience extends StatefulWidget {
  static const String routeName = 'work_experience';
  WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  final TextEditingController _companyController = TextEditingController();

  final TextEditingController _roleController = TextEditingController();

  final expSelected = [];

  // List<Company> addedCompanied = [];
  final date = 'Pick a date';

  final genderState = 0;

  final addedCompanies = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(context, "Work Experience"),
        body: "15,15,15,15".padding(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    header("Work Experience"),
                    ChipMultipleSelectable(
                      expSelected,
                      jobExperience,
                      isMultiSelectable: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    header("Add Companies you worked"),
                    Container(
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
                      width: double.infinity,
                      // height: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customTextField(
                            _companyController,
                            labelText: "",
                            hintText: "Company name",
                            islabel: true,
                          ),
                          customTextField(
                            _roleController,
                            labelText: "",
                            hintText: "Job Role",
                            islabel: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          customButtonWidget(
                            context,
                            width: 160,
                            color: primaryLight,
                            textColor: whiteColor,
                            () {
                              if (_companyController.text.isNotEmpty &&
                                  _roleController.text.isNotEmpty) {
                                final result = Company(
                                  companyName: _companyController.text,
                                  jobRole: _roleController.text,
                                );
                                setState(() {
                                  addedCompanies.add(result);
                                });
                              } else {
                                showSnackBar(context, "Please enter the missin fields");
                              }

                              print(addedCompanies);
                              print('add');
                            },
                            title: "Add",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          // horizontal: 10,
                          vertical: 10,
                        ),
                        shrinkWrap: true,
                        itemCount: addedCompanies.length,
                        itemBuilder: (context, index) {
                          Company company = addedCompanies[index];
                          return Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  // horizontal: 10,
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
                                width: double.infinity,
                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      company.companyName ?? '',
                                    ),
                                    Text(
                                      company.jobRole ?? '',
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: InkWell(
                                  onTap: () {
                                    // final isit =
                                    //     addedCompanies.contains(addedCompanies[index]);
                                    // if (isit) {
                                    setState(() {
                                      addedCompanies.remove(addedCompanies[index]);
                                    });
                                    // }
                                  },
                                  child: Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
