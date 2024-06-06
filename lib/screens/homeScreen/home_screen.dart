import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/commons/widgets/custom_image_network.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/homeScreen/widgets/all_jobs.dart';
import 'package:job_portal/screens/homeScreen/widgets/category_item.dart';
import 'package:job_portal/screens/homeScreen/widgets/employer_card.dart';
import 'package:job_portal/screens/homeScreen/widgets/featuredjob_card.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homeScreen";
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(
          "Job Categories",
        ),
        SizedBox(
          height: 220,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: iconList.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                icon: iconList[index],
                name: jobNames[index],
                number: jobs[index],
              );
            },
          ),
        ),
        "0,0,0,15".padding(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              header("Featured Jobs",),
              Text(
                'see all',
                style: fontSize.labelLarge(
                  context,
                  color: redColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 210,
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
              return FeaturedJobCard(
                jobName: featuredJobsName[index],
                jobRate: featuredJobsPrice[index],
                company: companies[index],
              );
            },
          ),
        ),
        "0,0,0,15".padding(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              header("Top Employers"),
              Text(
                'see all',
                style: fontSize.labelLarge(
                  context,
                  color: redColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              // vertical: 20,
              horizontal: 5,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return EmployerCard(
                name: employerName[index],
                image: employerImage[index],
              );
            },
          ),
        ),
        header("Reccommended For You"),
        ListView.builder(
          padding: const EdgeInsets.symmetric(
            // vertical: 20,
            horizontal: 5,
          ),
          shrinkWrap: true,
          itemCount: 4,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return AllJobCard(
              jobName: featuredJobsName[index],
              jobRate: featuredJobsPrice[index],
              company: companies[index],
            );
          },
        ),
      ],
    );
  }
}
