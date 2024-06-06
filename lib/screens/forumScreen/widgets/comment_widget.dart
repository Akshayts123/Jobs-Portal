import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/utils/theme.dart';

class CommentWidget extends StatelessWidget {
  final int index;
  const CommentWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool isme = index.isOdd ? true : false;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isme ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            right: 10,
          ),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(
              100,
            ),
            child: Image.asset(
              "assets/images/company/friends.jpg",
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: greyColor,
          ),
          margin: const EdgeInsets.symmetric(
            // horizontal: 10,
            vertical: 5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: width(context) * .5,
                child: Text(
                  "The following wireframe and brand guidelines are used in our design projects. https://dribbble.com Here's my latest exploration of a community.",
                  style: fontSize.bodySmall(
                    context,
                    color: blackColor,
                  ),
                ),
              ),
              Text(
                "10:14 thursday",
                style: fontSize.bodySmall(
                  context,
                  color: lightblackColor,
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Like",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                  VerticalDivider(),
                  Text(
                    "Reply",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
