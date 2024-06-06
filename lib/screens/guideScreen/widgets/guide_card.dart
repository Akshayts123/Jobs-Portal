import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/widgets/custom_image_icon.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';
import 'package:lottie/lottie.dart';

class GuideCard extends HookWidget {
  final String image;
  final String title;
  final String subtitle;

  const GuideCard({super.key, required this.image, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: Duration(milliseconds: 700),
      initialValue: 0,
    );
    final controllerSub = useAnimationController(
      duration: Duration(milliseconds: 500),
      initialValue: 0,
    );
    final animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    final animationSub =
        Tween<Offset>(begin: Offset(-.06, 0.0), end: Offset.zero).animate(controller);
    controller.forward();
    controllerSub.forward();
    // useEffect(() {
    //   Future.delayed(Duration(seconds: 1), () {
    //     controller.forward();
    //   });
    // });
    return "30,10,20,20".padding(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Lottie.asset(
            image,
            height: 350,
            width: 350,
            fit: BoxFit.contain,
          ),
          FadeTransition(
            opacity: animation,
            child: "0,0,10,0".padding(
              Text(
                title,
                style: fontSize.labelLarge(
                  context,
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: animationSub,
              child: Text(
                subtitle,
                style: fontSize.headline4(
                  context,
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
