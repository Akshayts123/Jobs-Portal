import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/utils/theme.dart';

class PostIntroWidget extends StatelessWidget {
  const PostIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      margin: const EdgeInsets.only(
        bottom: 40,
      ),
      // height: 250,
      // decoration: BoxDecoration(
      //   color: whiteColor,
      //   borderRadius: BorderRadius.circular(
      //     20,
      //   ),
      //   boxShadow: [
      //     BoxShadow(
      color: shadowGrey,
      //       spreadRadius: 2,
      //       blurRadius: 10,
      //     )
      //   ],
      // ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: const EdgeInsets.all(4),
              width: 100,
              height: 100,
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
              child: iconAssetImage("assets/icons/amazon-logo.png"),
            ),
            Column(
              children: [
                Text(
                  "Senior Ui/Ux Designer",
                  style: fontSize.headline6(
                    context,
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "San Francisco - USA",
                  style: fontSize.titleSmall(
                    context,
                    color: greyColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "40,000 - 65,000 /month",
                  style: fontSize.titleSmall(
                    context,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: width(context) * .8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(
                    backgroundColor: blackColor.withOpacity(.1),
                    label: Text(
                      "Fulltime",
                      style: fontSize.bodySmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: blackColor.withOpacity(.1),
                    label: Text(
                      "Design",
                      style: fontSize.bodySmall(
                        context,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: blackColor.withOpacity(.1),
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
          ],
        ),
      ),
    );
  }
}
