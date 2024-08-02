import 'package:flutter/material.dart';
import 'package:password_saver/presentation/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, this.onTaP,
  });
  final String text;
  final Function()? onTaP;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap:onTaP,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.teal),
        child:  CustomText(
          text: text,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
