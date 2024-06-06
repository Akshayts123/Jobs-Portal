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

class PersonalInfoScreen extends HookWidget {
  static const String routeName = 'personal_info';
  PersonalInfoScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final genderSelected = [];

  @override
  Widget build(BuildContext context) {
    final date = useState('Pick a date');
    final genderState = useState(0);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: customAppBar(context, "Personal Info"),
        body: SingleChildScrollView(
          child: "15,15,15,15".padding(
            Column(
              children: [
                header("Name"),
                customTextField(
                  _nameController,
                  labelText: "",
                  islabel: true,
                  hintText: "Full name",
                ),
                const SizedBox(
                  height: 20,
                ),
                header("DOB"),
                Align(
                  alignment: Alignment.centerLeft,
                  child: customButtonWidget(
                    context,
                    () async {
                      final initialDate = DateTime.now();

                      final dob = await showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );

                      date.value = dob != null
                          ? "${dob.day}/${dob.month}/${dob.year}"
                          : date.value != ""
                              ? date.value
                              : "";
                      print(dob.toString());
                    },
                    width: width(context) * .4,
                    color: shadowGrey,
                    textColor: blackColor,
                    title: date.value == '' ? "Pick a date" : date.value,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                header("Gender"),
                Row(
                  children: List.generate(
                      3,
                      (index) => Row(
                            children: [
                              Checkbox(
                                value: genderState.value == index,
                                onChanged: (value) {
                                  genderState.value = index;
                                },
                              ),
                              Text(
                                gender[index],
                              ),
                            ],
                          )),
                ),
                const SizedBox(
                  height: 20,
                ),
                header("Education"),
                Autocomplete(
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text == '') {
                      return filterEducation;
                    } else {
                      return filterEducation.where((element) {
                        return element.contains(textEditingValue.text);
                      });
                    }
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
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
                        // onSubmitted: (val) {
                        //   onFieldSubmitted();
                        // },
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
