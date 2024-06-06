import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class CompanyReview extends StatelessWidget {
  const CompanyReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header("Reviews"),
        ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: shadowGrey,
                  ),
                ),
                // borderRadius: BorderRadius.circular(
                //   10,
                // ),
                color: whiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        clipBehavior: Clip.hardEdge,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: shadowGrey,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            "assets/images/no-image.jpg",
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sherlin Mathews",
                            style: fontSize.bodyLarge(
                              context,
                              color: blackColor,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Mon 12th Aug 2021",
                                style: fontSize.bodySmall(
                                  context,
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print('show botom model sheet');
                        },
                        child: Icon(
                          Icons.more_vert_rounded,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "I’m excited to share the latest mobile app design exploration called Jobhunt. I’m excited to share the latest mobile app design exploration called Jobhunt. I’m excited to share the latest mobile app design exploration called Jobhunt.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: fontSize.bodyMedium(
                      context,
                      color: lightblackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: secondColor,
                        size: 18,
                      ),
                      Text("4.1"),
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
