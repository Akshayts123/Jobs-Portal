import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/utils/theme.dart';

class ImagePreviewScreen extends StatelessWidget {
  final String image;
  const ImagePreviewScreen({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final isNetwork = image.contains("http");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLight,
      ),
      body: Center(
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          child: AspectRatio(
            aspectRatio: 1,
            // color: redColor,
            // height: height(context),
            // width: width(context),
            child: isNetwork == true
                ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    // width: width(context),
                  )
                : Image.file(
                    File(image),
                    fit: BoxFit.cover,
                    // width: width(context),
                  ),
          ),
        ),
      ),
    );
  }
}
