import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/screens/image_preview.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/utils/theme.dart';

class GridImage extends StatelessWidget {
  final List<String> img;
  const GridImage({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: .9,
      ),
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: img.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ImagePreviewScreen(
                image: "assets/images/company/${img[index]}",
              ),
            ),
          );
        },
        child: Container(
          color: redColor,
          child: Image.asset(
            "assets/images/company/${img[index]}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
