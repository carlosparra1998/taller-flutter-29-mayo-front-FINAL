import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool smallMode;
  final bool passwordMode;
  final String? labelText;
  final TextEditingController? controller;
  const MyTextField({
    super.key,
    this.labelText,
    this.controller,
    this.smallMode = false,
    this.passwordMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: passwordMode,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        isDense: smallMode,
        contentPadding: smallMode ? const EdgeInsets.all(8) : null,
      ),
    );
  }
}
