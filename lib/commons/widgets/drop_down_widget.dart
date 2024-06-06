import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/utils/theme.dart';

class DropDownWidget extends HookWidget {
  String bottomSheetTitle;
  String subText;
  List<String> list;
  TextEditingController value;
  DropDownWidget(
      {super.key,
      required this.bottomSheetTitle,
      required this.subText,
      required this.list,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final valState = useState(bottomSheetTitle);
    return InkWell(
      onTap: () {
        showBottomSheet(context, bottomSheetTitle, list, value, valState);
      },
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),

        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: blackColorLight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        // height: 50,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    valState.value,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1,
                      color: blackColorLight,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_drop_down,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBottomSheet(BuildContext context, String title, List<String> list,
          TextEditingController value, ValueNotifier<String> valState) =>
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: blackColorLight,
                    ),
                  ),
                ),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600, letterSpacing: 0.2),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: list.map(
                    (e) {
                      return ListTile(
                        onTap: () {
                          value.text = e;
                          valState.value = e;
                          Navigator.pop(context);
                        },
                        title: Text(
                          e.toUpperCase(),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
      );
}
