import 'package:flutter/material.dart';
import 'package:job_portal/utils/theme.dart';

customCircleBgWidget({
  required Widget child,
}) =>
    Container(
      padding: const EdgeInsets.all(
        8,
      ),
      decoration: BoxDecoration(
        color: primaryLight,
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      child: child,
    );
