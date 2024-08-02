
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight, this.textColor, this.maxLines,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor; 
  final int? maxLines; 
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines??1,
      overflow: TextOverflow.ellipsis,
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: textColor??Colors.black,
      ),
    );
  }
}
