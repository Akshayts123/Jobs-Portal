import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/getOneJob/get_one_job.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class CompanyJobPosts extends StatelessWidget {
  const CompanyJobPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: .9,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      shrinkWrap: true,
      itemCount: 4,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CompanyPostWidget(
          jobName: featuredJobsName[index],
          company: companies[index],
          jobRate: jobRates[index],
        );
      },
    );
  }
}

class CompanyPostWidget extends HookWidget {
  final String jobName;
  final String company;
  final String jobRate;

  CompanyPostWidget({
    required this.jobName,
    required this.company,
    required this.jobRate,
  });

  @override
  Widget build(BuildContext context) {
    final bookmarkState = useState(false);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, GetOneJob.routeName);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(
          5,
        ),
        // height: 150,
        // width: width(context),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowGrey,
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
          color: whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: "0,0,10,15".padding(
                InkWell(
                  onTap: () {
                    bookmarkState.value = !bookmarkState.value;
                  },
                  child: Icon(
                    bookmarkState.value ? Icons.bookmark : Icons.bookmark_border,
                    color: blackColor,
                    size: 28,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
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
                    // fontSize: 17,
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
            const SizedBox(
              height: 20,
            ),

            // Spacer(),
            Center(
              child: Text(
                "120 applicants",
                style: fontSize.bodyMedium(
                  context,
                  color: redColor.withOpacity(.9),
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  jobShift.length,
                  (index) => Text(
                    "* ${jobShift[index]}",
                    style: fontSize.bodySmall(
                      context,
                      color: greyColor,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "$jobRate /month",
              style: fontSize.bodyMedium(
                context,
                color: primaryLight,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
