import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CheckedBox extends HookWidget {
  ValueNotifier<bool> selected;
  CheckedBox({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);
    return Checkbox(
        value: isSelected.value,
        onChanged: (value) {
          selected.value = !isSelected.value;
          isSelected.value = !isSelected.value;
        });
  }
}
