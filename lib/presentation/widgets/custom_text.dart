
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight, this.textColor,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: textColor??Colors.black,
      ),
    );
  }
}
