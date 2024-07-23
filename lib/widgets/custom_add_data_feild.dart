
import 'package:flutter/material.dart';
import 'package:password_saver/widgets/custom_text.dart';
import 'package:password_saver/widgets/custom_text_feild.dart';

class CustomAddDataFeild extends StatelessWidget {
  const CustomAddDataFeild({
    super.key,
    required this.text,
    required this.feildText,
  });
  final String text;
  final String feildText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CustomText(
                text: text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          CustomTextFeild(
            hintText: feildText,
          ),
        ],
      ),
    );
  }
}
