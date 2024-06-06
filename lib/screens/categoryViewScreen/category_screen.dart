import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/search_filter.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/homeScreen/widgets/all_jobs.dart';

class CategoryViewScreen extends StatelessWidget {
  static const String routeName = 'categoryViewScreen';
  const CategoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)?.settings.arguments as String;
    print(args.toString());
    return Scaffold(
      appBar: customAppBar(
        context,
        args.toUpperCase(),
      ),
      body: Column(children: [
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
              jobName: featuredJobsName[index],
              jobRate: featuredJobsPrice[index],
              company: companies[index],
            );
          },
        ),
      ]),
    );
  }
}
