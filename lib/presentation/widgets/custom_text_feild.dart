import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hintText,
    this.topPadding,
    this.prefixIcon,
    this.onChange, this.validator,
  });
  final String hintText;
  final double? topPadding;
  final Widget? prefixIcon;
  final Function(String?)? onChange;
  final String? Function(String?)?  validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0,bottom: 10
      ),
      child: TextFormField(
        validator:validator,
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: prefixIcon,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
