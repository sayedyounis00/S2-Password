
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 100),
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.teal),
        child: const CustomText(
          text: 'ADD PASSWORD',
          textColor: Colors.white,
        ),
      ),
    );
  }
}
