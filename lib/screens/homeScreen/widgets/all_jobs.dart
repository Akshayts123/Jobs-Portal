import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/screens/getOneJob/get_one_job.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class AllJobCard extends HookWidget {
  final bool isBookmark;
  final String company;
  final String jobName;
  final String jobRate;
  final double? cwidth;

  const AllJobCard({
    super.key,
    this.cwidth,
    this.isBookmark = false,
    required this.jobName,
    required this.jobRate,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    final bookmarkState = useState(isBookmark);
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
        height: 150,
        width: cwidth ?? width(context),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowGrey,
              spreadRadius: 2,
              blurRadius: 3,
            )
          ],
          // image: const DecorationImage(
          //   opacity: .5,
          //   image: AssetImage(
          //     "assets/images/lines-gradient.jpg",
          //   ),
          //   fit: BoxFit.cover,
          // ),
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
                      style: fontSize.titleMedium(
                        context,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
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
                    onTap: () {
                      bookmarkState.value = !bookmarkState.value;
                    },
                    child: Icon(
                      bookmarkState.value ? Icons.bookmark : Icons.bookmark_border,
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
            SizedBox(
              width: width(context) * .8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(
                    backgroundColor: blackColor.withOpacity(.05),
                    label: Text(
                      "Fulltime",
                      style: fontSize.bodySmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: blackColor.withOpacity(.05),
                    label: Text(
                      "Design",
                      style: fontSize.bodySmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: blackColor.withOpacity(.05),
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
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
