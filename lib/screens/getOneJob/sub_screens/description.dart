import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/homeScreen/widgets/all_jobs.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class PostDescription extends StatelessWidget {
  const PostDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header("Job Description"),
        "0,0,15,15".padding(
          Text(
            "I’m excited to share the latest mobile app design exploration called Jobhunt. Users can search for jobs from all over the world for the technology field, such as programmers, designers, and so on. Let me know your thoughts on this everyone. We hope this resource will inspire you. Scroll to see full version! 👇.",
            style: fontSize.bodyLarge(
              context,
              color: lightblackColor,
            ),
          ),
        ),
        header("Skills"),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          shrinkWrap: true,
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "* ",
                    style: fontSize.bodyLarge(
                      context,
                      color: blackColor,
                    ),
                  ),
                  TextSpan(
                    text: skills[index],
                    style: fontSize.bodyLarge(
                      context,
                      color: lightblackColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        header("Requirements"),
        "0,0,4,4".padding(
          Wrap(
            spacing: 5.0,
            runSpacing: 2.0,
            children: List.generate(
              requirements.length,
              (index) => Chip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      requirements[index],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        header("Shift Timings"),
        Container(
          width: double.infinity,
          // margin: const EdgeInsets.symmetric(
          //   vertical: 15,
          // ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: shadowGrey,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 3.0,
            children: List.generate(
              shiftTimings.length,
              (index) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: whiteColor,
                ),
                child: Text(
                  shiftTimings[index],
                ),
              ),
            ),
          ),
        ),
        header("Similar Jobs for you"),
        "0,10,0,0".padding(
          SizedBox(
            height: 160,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                // vertical: 20,
                horizontal: 5,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return AllJobCard(
                  cwidth: width(context) * .8,
                  jobName: featuredJobsName[index],
                  jobRate: featuredJobsPrice[index],
                  company: companies[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
