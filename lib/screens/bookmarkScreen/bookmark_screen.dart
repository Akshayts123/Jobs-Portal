import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/search_filter.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/appliedScreen/widgets/applied_card.dart';
import 'package:job_portal/screens/homeScreen/widgets/all_jobs.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "15,15,15,15".padding(
          "left".align(
            Text(
              "Your Bookmarks",
              style: fontSize.titleLarge(context),
            ),
          ),
        ),
        searchWidget(
          context,
          1,
        ),
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
              isBookmark: true,
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
