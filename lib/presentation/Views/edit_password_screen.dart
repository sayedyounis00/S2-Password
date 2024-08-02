import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/cubit/add_password_cubit/add_password_cubit.dart';
import 'package:password_saver/cubit/show_password_cubit/show_password_cubit.dart';
import 'package:password_saver/data/models/password_model.dart';
import 'package:password_saver/presentation/widgets/custom_text.dart';
import 'package:password_saver/presentation/widgets/custom_button.dart';
import 'package:password_saver/presentation/widgets/custom_text_feild.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({
    super.key,
    required this.passsword,
  });
  static String id = 'EditPasswordPage';
  final PasswordModel passsword;

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: BlocConsumer<AddPasswordCubit, AddPasswordState>(
            listener: (context, state) {
              if (state is AddPasswordSuccess) {
                BlocProvider.of<ShowPasswordCubit>(context).showpassword();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Edit Password',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const CustomText(text: 'title'),
                  CustomTextFeild(
                    hintText: widget.passsword.title,
                    onChange: (val) {
                      widget.passsword.title = val!;
                      widget.passsword.save();
                    },
                  ),
                  const CustomText(text: 'Url'),
                  CustomTextFeild(
                    hintText: widget.passsword.url ?? '',
                    onChange: (val) {
                        widget.passsword.url = val;
                      widget.passsword.save();
                    },
                  ),
                  const CustomText(text: 'email'),
                  CustomTextFeild(
                    hintText: widget.passsword.email,
                    onChange: (val) {
                        widget.passsword.email = val!;
                      widget.passsword.save();
                    },
                  ),
                  const CustomText(text: 'user_name'),
                  CustomTextFeild(
                    hintText: widget.passsword.userName,
                    onChange: (val) {
                        widget.passsword.userName = val!;
                      widget.passsword.save();
                    },
                  ),
                  const CustomText(text: 'password'),
                  CustomTextFeild(
                    hintText: widget.passsword.password,
                    onChange: (val) {
                        widget.passsword.password = val!;
                      widget.passsword.save();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: kPrimaryColor, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const CustomText(
                            text: 'GENRATE NEW',
                            fontWeight: FontWeight.bold,
                            textColor: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: 'Done',
                    onTaP: () {
                          Navigator.pop(context);
                        BlocProvider.of<ShowPasswordCubit>(context).showpassword();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
