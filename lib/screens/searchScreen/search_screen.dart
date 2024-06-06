import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/homeScreen/widgets/all_jobs.dart';
import 'package:job_portal/utils/sizables.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "searchScreen";
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Column(
        children: [
          "15,10,15,15".padding(
            customTextField(
              searchController,
              labelText: "",
              hintText: "Search for company, job titles ....",
              islabel: true,
              maxLength: 50,
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
