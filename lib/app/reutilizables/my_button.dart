import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? label;
  final Function? onPressed;
  final bool containsBorder;
  const MyButton({
    super.key,
    this.label,
    this.onPressed,
    this.containsBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed?.call(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: containsBorder ? BorderRadius.circular(20) : null,
          border:
              containsBorder ? Border.all(color: Colors.black, width: 3) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
          child: Text(
            label ?? '',
            style: TextStyle(
              fontSize: 18,
              decoration: containsBorder ? null : TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
