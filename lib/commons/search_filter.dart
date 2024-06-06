import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/screens/filterPopUp/filter_popup.dart';
import 'package:job_portal/screens/searchScreen/search_screen.dart';
import 'package:job_portal/utils/theme.dart';

class SearchAndfilter extends StatelessWidget {
  SearchAndfilter({super.key});

  final shift = <String>[];
  final experience = <String>[];
  final salary = <String>[];
  final education = <String>[];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            height: 55,
            width: width(context) * .72,
            decoration: BoxDecoration(
              color: whiteColor.withOpacity(.9),
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.search,
                  color: greyColor,
                  size: 20,
                ),
                Text(
                  "Search for companies, job titles ...",
                  style: fontSize.bodyLarge(
                    context,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            callFilter(
              context,
              shift,
              experience,
              salary,
              education,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: blackColor.withOpacity(.9),
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Icon(
              Icons.filter_list_rounded,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}

searchWidget(
  BuildContext context,
  double cwidth,
) =>
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        height: 55,
        width: width(context) * cwidth,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(.9),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.search,
              color: greyColor,
              size: 20,
            ),
            Text(
              "Search for companies, job titles ...",
              style: fontSize.bodyLarge(
                context,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
