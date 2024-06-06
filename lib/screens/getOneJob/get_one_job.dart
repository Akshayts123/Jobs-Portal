import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/getOneJob/sub_screens/amenities.dart';
import 'package:job_portal/screens/getOneJob/sub_screens/company.dart';
import 'package:job_portal/screens/getOneJob/sub_screens/description.dart';
import 'package:job_portal/screens/getOneJob/sub_screens/gallery.dart';
import 'package:job_portal/screens/getOneJob/sub_screens/job_posts.dart';
import 'package:job_portal/screens/getOneJob/sub_screens/reviews.dart';
import 'package:job_portal/screens/getOneJob/widgets/post_intro.dart';
import 'package:job_portal/screens/homeScreen/widgets/all_jobs.dart';
import 'package:job_portal/screens/homeScreen/widgets/featuredjob_card.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class GetOneJob extends HookWidget {
  static const String routeName = "get_one_job";
  final bool isEmployee;
  const GetOneJob({
    super.key,
    this.isEmployee = false,
  });

  @override
  Widget build(BuildContext context) {
    final subs = useState(0);

    final screens1 = [
      PostDescription(),
      CompanyAboutUs(),
      CompanyReview(),
    ];
    final screens2 = [
      CompanyJobPosts(),
      CompanyAboutUs(),
      CompanyReview(),
      CompanyGallery(),
      CompanyAmenities(),
    ];
    return Scaffold(
      backgroundColor: whiteColor,
      // appBar: customAppBar(
      //   context,
      //   "Job Details",
      // ),
      body: DefaultTabController(
        length: isEmployee ? screens2.length : screens1.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              collapsedHeight: 60,
              backgroundColor: primaryLight,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: blackColor,
                ),
              ),
              pinned: true,
              expandedHeight: 360,
              flexibleSpace: const FlexibleSpaceBar(
                background: PostIntroWidget(),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: shadowGrey,
                      ),
                    ),
                  ),
                  child: TabBar(
                    onTap: (value) {
                      subs.value = value;
                    },
                    indicator: BoxDecoration(
                      color: secondColor,
                    ),
                    labelColor: blackColor,
                    labelStyle: TextStyle(
                      color: whiteColor,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.zero,
                    // indicatorColor: secondColor,
                    labelPadding: EdgeInsets.zero,
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    tabs: List.generate(
                      isEmployee ? screens2.length : screens1.length,
                      (index) => Container(
                        width: 150,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        // decoration: BoxDecoration(
                        //   color: subs.value == index ? secondColor : whiteColor,
                        // ),
                        child: Text(
                          isEmployee
                              ? index != 0
                                  ? companyCategory[index]
                                  : "Post"
                              : companyCategory[index],
                          style: fontSize.bodyLarge(
                            context,
                            color: subs.value == index ? whiteColor : blackColor,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
          body: SingleChildScrollView(
            child: isEmployee ? screens2[subs.value] : screens1[subs.value],
          ),
        ),
      ),

      //   SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Container(
      //           margin: const EdgeInsets.symmetric(
      //             horizontal: 15,
      //             vertical: 10,
      //           ),
      //           height: 250,
      //           // decoration: BoxDecoration(
      //           //   color: whiteColor,
      //           //   borderRadius: BorderRadius.circular(
      //           //     20,
      //           //   ),
      //           //   boxShadow: [
      //           //     BoxShadow(
      //           color: shadowGrey,
      //           //       spreadRadius: 2,
      //           //       blurRadius: 10,
      //           //     )
      //           //   ],
      //           // ),
      //           child: Center(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Container(
      //                   margin: const EdgeInsets.symmetric(
      //                     horizontal: 10,
      //                   ),
      //                   padding: const EdgeInsets.all(4),
      //                   width: 100,
      //                   height: 100,
      //                   decoration: BoxDecoration(
      //                     color: whiteColor,
      //                     borderRadius: BorderRadius.circular(
      //                       8,
      //                     ),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: shadowGrey,
      //                         spreadRadius: 2,
      //                         blurRadius: 3,
      //                       )
      //                     ],
      //                   ),
      //                   child: iconAssetImage("assets/icons/amazon-logo.png"),
      //                 ),
      //                 Column(
      //                   children: [
      //                     Text(
      //                       "Senior Ui/Ux Designer",
      //                       style: fontSize.headline6(
      //                         context,
      //                         color: blackColor,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 18,
      //                       ),
      //                     ),
      //                     const SizedBox(
      //                       height: 5,
      //                     ),
      //                     Text(
      //                       "San Francisco - USA",
      //                       style: fontSize.titleSmall(
      //                         context,
      //                         color: greyColor,
      //                       ),
      //                     ),
      //                     const SizedBox(
      //                       height: 5,
      //                     ),
      //                     Text(
      //                       "40,000 - 65,000 /month",
      //                       style: fontSize.titleSmall(
      //                         context,
      //                         color: blackColor,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   width: width(context) * .8,
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       Chip(
      //                         backgroundColor: blackColor.withOpacity(.1),
      //                         label: Text(
      //                           "Fulltime",
      //                           style: fontSize.bodySmall(
      //                             context,
      //                             color: blackColor,
      //                           ),
      //                         ),
      //                       ),
      //                       Chip(
      //                         backgroundColor: blackColor.withOpacity(.1),
      //                         label: Text(
      //                           "Design",
      //                           style: fontSize.bodySmall(
      //                             context,
      //                             color: blackColor,
      //                           ),
      //                         ),
      //                       ),
      //                       Chip(
      //                         backgroundColor: blackColor.withOpacity(.1),
      //                         label: Text(
      //                           "Anywhere",
      //                           style: fontSize.bodySmall(
      //                             context,
      //                             color: blackColor,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 70,
      //           child: ListView.builder(
      //             padding: const EdgeInsets.symmetric(
      //               horizontal: 10,
      //               vertical: 10,
      //             ),
      //             scrollDirection: Axis.horizontal,
      //             itemCount: 5,
      //             itemBuilder: (context, index) {
      //               return InkWell(
      //                 onTap: () {
      //                   subs.value = index;
      //                 },
      //                 child: Container(
      //                   alignment: Alignment.center,
      //                   padding: const EdgeInsets.symmetric(
      //                     horizontal: 10,
      //                     vertical: 5,
      //                   ),
      //                   margin: const EdgeInsets.symmetric(
      //                     horizontal: 5,
      //                     vertical: 5,
      //                   ),
      //                   width: 100,
      //                   decoration: BoxDecoration(
      //                     color: subs.value == index ? secondColor : whiteColor,
      //                     borderRadius: BorderRadius.circular(
      //                       8,
      //                     ),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: shadowGrey,
      //                         spreadRadius: 2,
      //                         blurRadius: 10,
      //                       ),
      //                     ],
      //                   ),
      //                   child: Text(
      //                     companyCategory[index],
      //                     style: fontSize.bodyLarge(
      //                       context,
      //                       color: subs.value == index ? whiteColor : blackColor,
      //                       // fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //         screens[subs.value]
      //       ],
      //     ),
      //   ),
    );
  }
}
