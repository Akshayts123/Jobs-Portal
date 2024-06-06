import 'package:flutter/material.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/forumScreen/screens/form_view_post.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class ForumWidget extends StatelessWidget {
  final String image;
  final String companyIcon;
  final String title;
  final String companyName;

  const ForumWidget({
    super.key,
    required this.image,
    required this.title,
    required this.companyIcon,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final post = ForumPostClass(
          companyIcon: companyIcon,
          companyName: companyName,
          title: title,
          image: image,
        );
        Navigator.pushNamed(
          context,
          ForumViewPost.routeName,
          arguments: post,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          // horizontal: 10,
          vertical: 5,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: shadowGrey,
              spreadRadius: 2,
              blurRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      iconAssetImage(
                        "assets/icons/$companyIcon",
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      companyName,
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
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.star,
                    //       color: redColor,
                    //       size: 20,
                    //     ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text(
                    //       "3.5",
                    //       style: fontSize.subtitle1(
                    //         context,
                    //         color: blackColor,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                Spacer(),
                Text(
                  '12mins ago',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: lightblackColor,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: fontSize.titleMedium(
                    context,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: fontSize.bodyMedium(
                    context,
                    color: lightblackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(
                8,
              ),
              child: Image.asset(
                height: 150,
                width: double.infinity,
                "assets/images/company/$image",
                fit: BoxFit.cover,
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   title,
            //   style: fontSize.bodySmall(
            //     context,
            //     color: lightblackColor,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    print('liked');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        color: blackColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '1.5k',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: blackColor,
                            ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('comment');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.comment_outlined,
                        color: blackColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '500',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: blackColor,
                            ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('share');
                  },
                  child: const Icon(
                    Icons.share,
                    color: blackColor,
                    size: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('send');
                  },
                  child: Transform.rotate(
                    angle: -.4,
                    child: const Icon(
                      Icons.send,
                      color: blackColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
