import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/screens/categoryViewScreen/category_screen.dart';
import 'package:job_portal/utils/theme.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String name;
  final String number;

  const CategoryItem({super.key, required this.icon, required this.name, required this.number});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CategoryViewScreen.routeName,
          arguments: name,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        clipBehavior: Clip.hardEdge,
        // width: 150,
        // height: 180,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowGrey,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                  color: Color.fromARGB(255, 173, 203, 248),
                ),
                child: iconAssetImage(
                  "assets/icons/$icon",
                  25,
                  blackColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${name.toUpperCase()}",
                style: fontSize.labelMedium(
                  context,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$number Posts',
                style: fontSize.labelSmall(
                  context,
                  color: lightblackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
