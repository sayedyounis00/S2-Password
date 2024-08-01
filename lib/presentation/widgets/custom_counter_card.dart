import 'package:flutter/material.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/presentation/widgets/custom_text.dart';

class CustomCounterCard extends StatelessWidget {
  const CustomCounterCard({
    super.key,
    required this.topText,
    required this.underText,
  });
  final String topText;
  final String underText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 10, top: 25),
        height: 170,
        decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: topText,
              fontSize: 60,
              fontWeight: FontWeight.bold,
              textColor: kPrimaryColor,
            ),
            SizedBox(
              width: 110,
              child: CustomText(
                text: underText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
