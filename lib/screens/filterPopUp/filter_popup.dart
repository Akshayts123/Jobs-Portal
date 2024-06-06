import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

callFilter(
  BuildContext context,
  List<String> shift,
  List<String> exp,
  List<String> salary,
  List<String> education,
) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text('filter'),
          content: Stack(
            children: [
              Container(
                color: whiteColor,
                // padding: const EdgeInsets.all(
                //   10,
                // ),
                height: height(context) * .9,
                width: width(context) * .9,
                child: Column(
                  children: [
                    const Text(
                      'Filter',
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            header("Job Category"),
                            Autocomplete(
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return alljobs;
                                } else {
                                  return alljobs.where((element) {
                                    return element.contains(textEditingValue.text);
                                  });
                                }
                              },
                              fieldViewBuilder:
                                  (context, textEditingController, focusNode, onFieldSubmitted) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: shadowGrey,
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
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
                                      hintText: "Select your Role",
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            header("Job Type"),
                            ChipMultipleSelectable(
                              shift,
                              jobShift,
                            ),
                            header("Experience"),
                            FilterSelectableWidget(
                              selected: shift,
                              list: jobExperience,
                            ),
                            header("Salary"),
                            FilterSelectableWidget(
                              selected: salary,
                              list: jobSalary,
                            ),
                            header("Education"),
                            FilterSelectableWidget(
                              selected: education,
                              list: filterEducation,
                            ),
                            // ChipMultipleSelectable(shift, jobShift),
                            // ChipMultipleSelectable(shift, jobShift),
                          ],
                        ),
                      ),
                    ),
                    "20,0,0,0".padding(
                      customButtonWidget(context, () {
                        print(shift.toString());
                      }, title: "show 120 results"),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

class FilterSelectableWidget extends HookWidget {
  final List<String> selected;
  final List<String> list;
  const FilterSelectableWidget({
    super.key,
    required this.selected,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    final expand = useState(false);
    return Column(
      children: [
        CheckboxMultipleSelectable(
          selected,
          list,
          expand: expand,
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              expand.value = !expand.value;
            },
            child: Text(
              expand.value ? "See less" : "See all",
              style: fontSize.bodyLarge(
                context,
                color: secondColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChipMultipleSelectable extends StatefulWidget {
  List selected;
  final List options;
  final bool? isMultiSelectable;

  ChipMultipleSelectable(this.selected, this.options, {this.isMultiSelectable = false});

  @override
  State<ChipMultipleSelectable> createState() => _ChipMultipleSelectableState();
}

class _ChipMultipleSelectableState extends State<ChipMultipleSelectable> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 2,
      spacing: 2,
      children: List.generate(
        widget.options.length,
        (index) => InkWell(
          onTap: () {
            if (widget.selected.contains(widget.options[index])) {
              setState(() {
                widget.selected.remove(widget.options[index]);
              });
              print(widget.selected);
              return;
            }
            setState(() {
              widget.isMultiSelectable == true
                  ? widget.selected = [widget.options[index]]
                  : widget.selected.add(widget.options[index]);
            });
            print(widget.selected);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              border: Border.all(
                width: .5,
                color: greyColor,
              ),
              color: widget.selected.contains(widget.options[index]) ? secondColor : whiteColor,
            ),
            child: Text(
              widget.options[index],
              style: fontSize.bodyMedium(context),
            ),
          ),
        ),
      ),
    );
    // ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: widget.options.length,
    //   itemBuilder: (context, index) {
    //     return InkWell(
    //       onTap: () {
    //         if (widget.selected.contains(widget.options[index])) {
    //           setState(() {
    //             widget.selected.remove(widget.options[index]);
    //           });
    //           print(widget.selected);
    //           return;
    //         }
    //         setState(() {
    //           widget.selected.add(widget.options[index]);
    //         });
    //         print(widget.selected);
    //       },
    //       child: Container(
    //         margin: const EdgeInsets.symmetric(
    //           horizontal: 5,
    //           vertical: 5,
    //         ),
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 10,
    //           vertical: 10,
    //         ),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(
    //             10,
    //           ),
    //           color: widget.selected.contains(widget.options[index]) ? secondColor : whiteColor,
    //         ),
    //         child: Text(
    //           widget.options[index],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}

class CheckboxMultipleSelectable extends StatefulWidget {
  final List selected;
  final List options;
  final ValueNotifier<bool>? expand;
  final bool? isExpand;

  CheckboxMultipleSelectable(this.selected, this.options, {this.expand, this.isExpand = true});

  @override
  State<CheckboxMultipleSelectable> createState() => _CheckboxMultipleSelectableState();
}

class _CheckboxMultipleSelectableState extends State<CheckboxMultipleSelectable> {
  // final expand = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.isExpand == true
          ? widget.options.length >= 3
              ? widget.expand!.value
                  ? widget.options.length
                  : 3
              : widget.options.length
          : widget.options.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: widget.selected.contains(widget.options[index]),
              onChanged: (val) {
                if (widget.selected.contains(widget.options[index])) {
                  setState(() {
                    widget.selected.remove(widget.options[index]);
                  });
                  print(widget.selected);
                  return;
                }
                setState(
                  () {
                    widget.selected.add(widget.options[index]);
                  },
                );
                print(widget.selected);
              },
            ),
            Text(
              widget.options[index],
              style: fontSize.bodyMedium(context),
            ),
          ],
        );
      },
    );
  }
}
