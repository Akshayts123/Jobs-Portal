import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/screens/forumScreen/widgets/comment_widget.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class ForumViewPost extends HookWidget {
  static const String routeName = "ForumViewPost";

  ForumViewPost({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final likedState = useState(false);
    final args = ModalRoute.of(context)?.settings.arguments as ForumPostClass;
    return Scaffold(
      appBar: customAppBar(context),
      body: "10,10,15,15".padding(
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                                "assets/icons/${args.companyIcon}",
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              args.companyName ?? '',
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
                          args.title ?? '',
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
                          args.title ?? '',
                          style: fontSize.bodyMedium(
                            context,
                            color: lightblackColor,
                            fontWeight: FontWeight.w500,
                          ),
                          // maxLines: 4,
                          // overflow: TextOverflow.ellipsis,
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
                        "assets/images/company/${args.image}",
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                likedState.value = !likedState.value;
                                print('liked');
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    likedState.value ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
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
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     print('comment');
                        //   },
                        //   icon: const Icon(
                        //     Icons.comment_outlined,
                        //     size: 20,
                        //   ),
                        // ),
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
                    Divider(),
                    header("Comments"),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CommentWidget(
                          index: index,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            customTextField(
              controller,
              islabel: true,
              labelText: "",
              hintText: "comment here",
            ),
          ],
        ),
      ),
    );
  }
}
