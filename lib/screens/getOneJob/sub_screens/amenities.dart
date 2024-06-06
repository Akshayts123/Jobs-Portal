import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_portal/commons/widgets/staggered_grid_image.dart';
import 'package:job_portal/dummy.dart';

class CompanyAmenities extends StatelessWidget {
  const CompanyAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    return GridImage(img: companyGallery);
  }
}
