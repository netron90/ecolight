import 'package:flutter/material.dart';

class CustomColorSet extends StatelessWidget {
  CustomColorSet(
      {required this.onPressed,
      required this.selectedColorSet,
      required this.customLightColor});
  final VoidCallback onPressed;
  Color selectedColorSet, customLightColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: CircleBorder(
          side: BorderSide(width: 6.0, color: selectedColorSet),
        ),
        fillColor: customLightColor,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 0),
        constraints: BoxConstraints(minWidth: 56.0),
      ),
    );
  }
}