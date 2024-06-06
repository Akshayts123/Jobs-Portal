import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class CompanyAboutUs extends StatelessWidget {
  const CompanyAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header("About us"),
        "0,0,15,15".padding(
          Text(
            "I’m excited to share the latest mobile app design exploration called Jobhunt. Users can search for jobs from all over the world for the technology field, such as programmers, designers, and so on. Let me know your thoughts on this everyone. We hope this resource will inspire you. Scroll to see full version! 👇. I’m excited to share the latest mobile app design exploration called Jobhunt. Users can search for jobs from all over the world for the technology field, such as programmers, designers, and so on. Let me know your thoughts on this everyone. I’m excited to share the latest mobile app design exploration called Jobhunt. Users can search for jobs from all over the world for the technology field, such as programmers, designers, and so on. Let me know your thoughts on this everyone.",
            style: fontSize.bodyLarge(
              context,
              color: lightblackColor,
            ),
          ),
        ),
      ],
    );
  }
}
