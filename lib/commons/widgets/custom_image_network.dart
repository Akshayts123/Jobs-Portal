import 'package:flutter/material.dart';

customNetworkImage(String src, double size) => Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: size,
        width: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            src,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              return Image.asset(
                "assets/images/no-image.jpg",
                height: size,
                width: size,
                fit: BoxFit.cover,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/no-image.jpg",
                height: size,
                width: size,
                fit: BoxFit.cover,
              );
            },
            height: size,
            width: size,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
