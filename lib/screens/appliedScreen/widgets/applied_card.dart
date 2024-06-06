import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/screens/getOneJob/get_one_job.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class AppliedCard extends HookWidget {
  final int index;
  final String company;
  final String jobName;
  final String jobRate;

  const AppliedCard({
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
        Navigator.pushNamed(context, GetOneJob.routeName);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        height: 170,
        width: width(context),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowGrey,
              spreadRadius: 2,
              blurRadius: 3,
            )
          ],
          color: whiteColor,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  padding: const EdgeInsets.all(4),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(
                      8,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobName,
                      style: fontSize.headline6(
                        context,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "San Francisco - USA",
                      style: fontSize.bodyLarge(
                        context,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                "0,0,10,15".padding(
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: blackColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Spacer(),
            SizedBox(
              width: width(context) * .7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "4h ago",
                    style: fontSize.titleSmall(
                      context,
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "120 applicants",
                    style: fontSize.bodyMedium(
                      context,
                      color: redColor.withOpacity(.9),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            "10,10,25,15".padding(
              "left".align(
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: shadowGrey,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Text(
                    index == 0
                        ? 'Delivered'
                        : index == 1
                            ? "Rejected"
                            : index == 2
                                ? "Waiting for resposne"
                                : "Delivered",
                    style: fontSize.bodyLarge(
                      context,
                      color: index == 0
                          ? Color.fromARGB(255, 1, 141, 54)
                          : index == 1
                              ? Color.fromARGB(255, 255, 112, 112)
                              : index == 2
                                  ? Color.fromARGB(255, 255, 184, 78)
                                  : Color.fromARGB(255, 1, 141, 54),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
