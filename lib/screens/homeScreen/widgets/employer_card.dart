import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/screens/getOneJob/get_one_job.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class EmployerCard extends StatelessWidget {
  final String name;
  final String image;

  const EmployerCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GetOneJob(
              isEmployee: true,
            ),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        height: 150,
        width: width(context) * .6,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowGrey,
              spreadRadius: 3,
              blurRadius: 3,
            )
          ],
          color: whiteColor,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                "0,0,15,10".padding(
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: shadowGrey,
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: "10,10,10,10".padding(
                      iconAssetImage("assets/icons/$image"),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: fontSize.titleSmall(
                        context,
                        color: redColor,
                      ),
                    ),
                    Text(
                      "Ohio Terrance county",
                      style: fontSize.subtitle2(
                        context,
                        color: blackColor,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: redColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "3.5",
                          style: fontSize.subtitle1(
                            context,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'View Jobs',
                style: fontSize.bodyMedium(
                  context,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
