import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/screens/getOneJob/get_one_job.dart';
import 'package:job_portal/screens/inboxScreen/sub_screens/chat_screen.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class InboxCard extends HookWidget {
  final int index;
  final String company;
  final String jobName;
  final String jobRate;

  const InboxCard({
    super.key,
    required this.index,
    required this.jobName,
    required this.jobRate,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ChatScreen.routeName,
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        margin: const EdgeInsets.symmetric(
          // vertical: 5,
          horizontal: 5,
        ),
        height: 100,
        width: width(context),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: shadowGrey,
            ),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: shadowGrey,
          //     spreadRadius: 2,
          //     blurRadius: 3,
          //   )
          // ],
          // image: const DecorationImage(
          //   opacity: .5,
          //   image: AssetImage(
          //     "assets/images/lines-gradient.jpg",
          //   ),
          //   fit: BoxFit.cover,
          // ),
          // color: whiteColor,
          // borderRadius: BorderRadius.circular(
          //   20,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            "right".align(
              SizedBox(
                width: width(context) * .7,
                child: "0,10,10,30".padding(
                  "right".align(
                    Text(
                      "4mins ago",
                      style: fontSize.bodySmall(
                        context,
                        color: primaryLight.withOpacity(.9),
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: shadowGrey,
                        spreadRadius: 2,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: iconAssetImage("assets/icons/$company"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      jobName,
                      style: fontSize.titleMedium(
                        context,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          index == 0
                              ? Icons.edit_note_rounded
                              : index == 2
                                  ? Icons.record_voice_over_outlined
                                  : Icons.edit_note_rounded,
                          color: greyColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: width(context) * .6,
                          child: Text(
                            "could you please share your updated resume.",
                            style: fontSize.bodySmall(
                              context,
                              color: greyColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
