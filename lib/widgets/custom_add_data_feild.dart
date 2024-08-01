import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_saver/cubit/cubit/add_password_cubit.dart';
import 'package:password_saver/presentation/widgets/custom_text.dart';
import 'package:password_saver/presentation/widgets/custom_text_feild.dart';

class CustomAddDataFeild extends StatefulWidget {
  const CustomAddDataFeild({
    super.key,
    required this.text,
    required this.feildText,
    this.onChange,
  });
  final String text;
  final String feildText;
  final Function(String?)? onChange;

  @override
  State<CustomAddDataFeild> createState() => _CustomAddDataFeildState();
}

class _CustomAddDataFeildState extends State<CustomAddDataFeild> {
  @override
  void initState() {
    BlocProvider.of<AddPasswordCubit>(context);
    super.initState();
  }

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
                text: widget.text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          CustomTextFeild(
            onChange: (value) {},
            hintText: widget.feildText,
          ),
        ],
      ),
    );
  }
}
