import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/search_filter.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/forumScreen/widgets/form_post_widget.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class forumScreen extends StatelessWidget {
  static const String routeName = "forumScreen";
  const forumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header(
        //   "Latest Posts",
        // ),
        searchWidget(
          context,
          width(context),
        ),
        ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return ForumWidget(
              image: companyGallery[index],
              title: forumDescriptions[index],
              companyIcon: companies[index],
              companyName: employerName[index],
            );
          },
        )
      ],
    );
  }
}
