import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/utils/theme.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {
  final double borderRadius;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;
  final double progress;

  CircleProgress({
    required this.borderRadius,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
    required this.progress,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint rectange = Paint()
      ..strokeWidth = strokeWidth
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;

    Paint animateArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    Path progressPath = Path();

    path.moveTo(borderRadius, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width - borderRadius, borderRadius), radius: borderRadius),
        -pi / 2,
        pi / 2,
        false);
    path.lineTo(size.width, size.height - borderRadius);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width - borderRadius, size.height - borderRadius),
            radius: borderRadius),
        0,
        pi / 2,
        false);
    path.lineTo(0 + borderRadius, size.height);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(borderRadius, size.height - borderRadius), radius: borderRadius),
        pi / 2,
        pi / 2,
        false);
    path.lineTo(0, borderRadius);
    path.arcTo(Rect.fromCircle(center: Offset(borderRadius, borderRadius), radius: borderRadius),
        pi, pi / 2, false);

    for (PathMetric pathMetric in path.computeMetrics()) {
      progressPath.addPath(
        pathMetric.extractPath(0, pathMetric.length * progress),
        Offset.zero,
      );
    }

    // progressPath = progressPath.transform(Matrix4Transform().rotateByCenter(0, size).m.storage);
    canvas.drawPath(path, rectange);
    canvas.drawPath(progressPath, animateArc);

    // canvas.drawArc(
    //   Rect.fromCenter(
    //     center: center,
    //     width: 150,
    //     height: 80,
    //   ),
    //   pi / 2,
    //   angle,
    //   false,
    //   animateArc,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomCircleProgressIndicator extends HookWidget {
  final double borderRadius;
  final double height;
  final double width;
  final double strokeWidth;
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final Widget? child;

  CustomCircleProgressIndicator(
      {this.borderRadius = 10,
      this.height = 60,
      this.width = 100,
      this.strokeWidth = 15,
      this.backgroundColor = Colors.grey,
      this.progressColor = Colors.orange,
      this.child,
      this.progress = 0.0});

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: Duration(milliseconds: 3000), initialValue: 1);
    Animation animation = Tween<double>(begin: 0, end: 100).animate(controller)..addListener(() {});
    // controller.repeat(reverse: false);

    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
          foregroundPainter: CircleProgress(
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
              borderRadius: borderRadius,
              progress: progress),
          child: child),
    );
  }
}
