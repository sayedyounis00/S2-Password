import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/cubit/add_password_cubit/add_password_cubit.dart';
import 'package:password_saver/cubit/show_password_cubit/show_password_cubit.dart';
import 'package:password_saver/data/models/password_model.dart';
import 'package:password_saver/widgets/custom_text.dart';
import 'package:password_saver/widgets/custom_button.dart';
import 'package:password_saver/widgets/custom_text_feild.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});
  static String id = 'addPasswordPage';

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  String? title, pass, email, url, userName;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddPasswordCubit>(context).addPassword;
    // BlocProvider.of<ShowPasswordCubit>(context);
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
                        text: 'ADD NEW',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomText(text: 'title'),
                        CustomTextFeild(
                          hintText: 'Website/AppName',
                          onChange: (val) {
                            title = val;
                            // log(title!);
                          },
                        ),
                        const CustomText(text: 'Url'),
                        CustomTextFeild(
                          hintText: 'Website Url',
                          onChange: (val) {
                            url = val;
                            // log(title!);
                          },
                        ),
                        const CustomText(text: 'email'),
                        CustomTextFeild(
                          hintText: 'example@mail.com',
                          onChange: (val) {
                            email = val;
                            // log(email!);
                          },
                        ),
                        const CustomText(text: 'user_name'),
                        CustomTextFeild(
                          hintText: 'user_name',
                          onChange: (val) {
                            userName = val;
                            // log(userName!);
                          },
                        ),
                        const CustomText(text: 'password'),
                        CustomTextFeild(
                          hintText: 'password',
                          onChange: (val) {
                            pass = val;
                            // log(title!);
                          },
                        ),
                      ],
                    ),
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
                    text: 'ADD PASSWORD',
                    onTaP: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AddPasswordCubit>(context)
                            .addPassword(PasswordModel(
                          title: title!,
                          password: pass!,
                          email: email!,
                          userName: userName!,
                          url: url,
                        ));
                        BlocProvider.of<AddPasswordCubit>(context);
                      } else {
                        return null;
                      }
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
