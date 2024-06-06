import 'package:flutter/material.dart';

customDraggableSheet(
  BuildContext context,
  Widget widget, {
  List<double>? snapSizes,
  double? initialSize,
  double? maxSize,
}) =>
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
          bottomLeft: Radius.circular(
            0,
          ),
          bottomRight: Radius.circular(
            0,
          ),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        final bool isClicked = false;
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: DraggableScrollableSheet(
            expand: false,
            snap: true,
            snapSizes: snapSizes ?? [0.7, 0.9],
            // heightFactor: isClicked == true ? 1 : .7,
            maxChildSize: maxSize ?? 0.9,
            initialChildSize: initialSize ?? 0.7,
            minChildSize: 0,
            builder: (context, scrollController) {
              return SingleChildScrollView(controller: scrollController, child: widget);
            },
          ),
        );
      },
    );
