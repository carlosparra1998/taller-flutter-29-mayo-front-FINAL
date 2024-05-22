import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  bool smallMode;
  final String? labelText;
  List<String> items;
  String? value;
  Function(String?) onChanged;
  MyDropdown({
    super.key,
    this.labelText,
    this.smallMode = false,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      borderRadius: BorderRadius.circular(8),
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        isDense: smallMode,
        contentPadding: smallMode ? const EdgeInsets.all(8) : null,
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              alignment: AlignmentDirectional.centerStart,
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (e) => onChanged.call(e),
      value: value,
    );
  }
}
