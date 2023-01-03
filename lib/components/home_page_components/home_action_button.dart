import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  ActionButton(
      {required this.onPressed,
      required this.btnBorderColor,
      required this.btnFillColor,
      this.icon,
      this.iconColor});

  final VoidCallback onPressed;
  Color btnBorderColor, btnFillColor;
  Color? iconColor;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(
        side: BorderSide(width: 1.0, color: btnBorderColor),
      ),
      fillColor: btnFillColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 0),
      constraints: BoxConstraints(minWidth: 56.0),
    );
  }
}
