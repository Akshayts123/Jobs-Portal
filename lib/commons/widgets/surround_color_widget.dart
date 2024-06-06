import 'package:flutter/material.dart';
import 'package:job_portal/utils/theme.dart';

surroundColoredContainer(Color surroundColor) => Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: surroundColor,
      ),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
