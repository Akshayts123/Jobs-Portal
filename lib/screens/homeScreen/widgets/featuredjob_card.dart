import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/screens/getOneJob/get_one_job.dart';
import 'package:job_portal/utils/theme.dart';

class FeaturedJobCard extends StatelessWidget {
  final String company;
  final String jobName;
  final String jobRate;

  const FeaturedJobCard({
    super.key,
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
          vertical: 20,
          horizontal: 10,
        ),
        // height: 200,
        width: width(context) * .8,
        decoration: BoxDecoration(
          image: const DecorationImage(
            opacity: .3,
            image: AssetImage(
              "assets/images/lines-gradient.jpg",
            ),
            fit: BoxFit.cover,
          ),
          color: primaryLight,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: greyColor,
                    //     spreadRadius: 2,
                    //     blurRadius: 3,
                    //   )
                    // ],
                  ),
                  child: iconAssetImage("assets/icons/$company"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobName,
                      style: fontSize.titleMedium(
                        context,
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "San Francisco - USA",
                      style: fontSize.bodyLarge(
                        context,
                        color: shadowGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width(context) * .8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(
                    backgroundColor: whiteColor,
                    label: Text(
                      "Fulltime",
                      style: fontSize.bodySmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: whiteColor,
                    label: Text(
                      "Design",
                      style: fontSize.bodySmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: whiteColor,
                    label: Text(
                      "Anywhere",
                      style: fontSize.bodySmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: width(context) * .7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: jobRate,
                          style: fontSize.titleMedium(
                            context,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " /month",
                          style: fontSize.bodyMedium(
                            context,
                            color: shadowGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "4h ago",
                    style: fontSize.bodyLarge(
                      context,
                      color: shadowGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
