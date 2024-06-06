import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/search_filter.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/appliedScreen/widgets/applied_card.dart';
import 'package:job_portal/screens/homeScreen/widgets/all_jobs.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class ApplicationsAppliedScreen extends HookWidget {
  ApplicationsAppliedScreen({super.key});

  final screen = [
    AppliedScreen(),
    AppliedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    return Column(
      children: [
        DefaultTabController(
          length: 2,
          child: TabBar(
            indicatorColor: primaryColor,
            onTap: (value) {
              index.value = value;
            },
            labelColor: blackColor,
            unselectedLabelColor: blackColor,
            tabs: const [
              Tab(
                height: 60,
                text: 'Applied',
              ),
              Tab(
                height: 60,
                text: 'Interview',
              ),
            ],
          ),
        ),
        screen[index.value]

        // "15,15,15,15".padding(
        //   "left".align(
        //     Text(
        //       "Your Applications",
        //       style: fontSize.titleLarge(context),
        //     ),
        //   ),
        // ),
        // SearchAndfilter(),
      ],
    );
  }
}

class AppliedScreen extends StatelessWidget {
  const AppliedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      shrinkWrap: true,
      itemCount: 4,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return AppliedCard(
          index: index,
          jobName: featuredJobsName[index],
          jobRate: featuredJobsPrice[index],
          company: companies[index],
        );
      },
    );
  }
}
