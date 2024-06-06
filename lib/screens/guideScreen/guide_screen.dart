import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/screens/gettingStartedScreen/getting_started_screen.dart';
import 'package:job_portal/screens/guideScreen/widgets/guide_card.dart';
import 'package:job_portal/screens/loginScreen/login_screen.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class GuideScreen extends HookWidget {
  static const String routeName = "guideScreen";
  GuideScreen({super.key});

  final imgList = ["job-search.json", "job-join.json", "right-job.json"];
  final subtitles = [
    'Get into FAANG companies with just one click.',
    'Get hired to your dream job in no time. We are here to help!!',
    "Get in touch with nearest jobs available to any jobs anywhere."
  ];

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final indexState = useState(0);
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 230, 253, 255),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 580,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  indexState.value = value;
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GuideCard(
                    title: 'Welcome Screen 0${index + 1}',
                    subtitle: subtitles[index],
                    image: 'assets/lottie/${imgList[index]}',
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < imgList.length; i++)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: const EdgeInsets.all(2),
                    width: i == indexState.value ? 20 : 8,
                    height: i == indexState.value ? 10 : 8,
                    decoration: BoxDecoration(
                      color: i == indexState.value ? secondColor : Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
              ],
            ),
            "25,10,15,15".padding(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  indexState.value == 0
                      ? const SizedBox()
                      : customButtonWidget(
                          context,
                          () {
                            controller.previousPage(
                                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          },
                          // width: width(context) * .3,
                          height: 55,
                          width: 80,
                          widget: const Icon(
                            Icons.arrow_back_outlined,
                            color: whiteColor,
                          ),
                          fontSize: 20,
                          color: blackColor,
                        ),
                  customButtonWidget(
                    context,
                    () {
                      indexState.value == 2
                          ? Navigator.pushNamed(context, GettingStartedScreen.routeName)
                          : controller.nextPage(
                              duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    width: width(context) * .4,
                    height: 65,
                    title: indexState.value == 2 ? "Let's Go" : null,
                    widget: indexState.value == 2
                        ? null
                        : const Icon(
                            Icons.arrow_forward_rounded,
                            color: whiteColor,
                          ),
                    fontSize: 20,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
