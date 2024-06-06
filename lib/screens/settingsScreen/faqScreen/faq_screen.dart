import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/settingsScreen/helpCenterScreen/help_center_screen.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class FAQScreen extends StatefulWidget {
  static const String routeName = "FAQScreen";
  FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  var isHide = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryLight,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, HelpCenterScreen.routeName);
            },
            child: Text(
              "contact us",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: blackColor,
                  ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header("Frequently Asked Questions"),
            "0,0,15,15".padding(ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (isHide.contains(index)) {
                        setState(() {
                          isHide = [];
                        });
                        return;
                      }
                      setState(() {
                        isHide = [index];
                      });
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      // horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: shadowGrey,
                        ),
                      ),
                    ),
                    width: width(context),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width(context) * .7,
                              child: Text(
                                faqQ[index],
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: blackColor,
                                    ),
                              ),
                            ),
                            Icon(
                              isHide.contains(index)
                                  ? Icons.arrow_drop_up_sharp
                                  : Icons.arrow_drop_down_outlined,
                            ),
                          ],
                        ),
                        isHide.contains(index)
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    forumDescriptions[index],
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: lightblackColor,
                                        ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
