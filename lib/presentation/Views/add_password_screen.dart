import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/cubit/cubit/add_password_cubit.dart';
import 'package:password_saver/data/models/password_model.dart';
import 'package:password_saver/widgets/custom_text.dart';
import 'package:password_saver/widgets/custom_add_data_feild.dart';
import 'package:password_saver/widgets/custom_button.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});
  static String id = 'addPasswordPage';

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  String? title, pass, email, url, userName;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddPasswordCubit>(context);
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
              // TODO: implement listener
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
                  CustomAddDataFeild(
                    text: 'title',
                    feildText: 'Website/AppName',
                    onChange: (val) {
                      title = val;
                      log(title!);
                    },
                  ),
                  CustomAddDataFeild(
                    text: 'Url',
                    feildText: 'Website Url',
                    onChange: (val) {
                      url = val;
                    },
                  ),
                  CustomAddDataFeild(
                    text: 'email',
                    feildText: 'example@mail.com',
                    onChange: (val) {
                      email = val;
                    },
                  ),
                  CustomAddDataFeild(
                    text: 'USERNAME',
                    feildText: 'user name',
                    onChange: (val) {
                      userName = val;
                    },
                  ),
                  CustomAddDataFeild(
                    text: 'password',
                    feildText: 'Password',
                    onChange: (val) {
                      pass = val;
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
                    text: 'ADD PASSWORD',
                    onTaP: () {
                      PasswordModel passwordModel = PasswordModel(
                        title: title!,
                        password: pass!,
                        email: email!,
                        userName: userName!,
                        url: url,
                      );
                      BlocProvider.of<AddPasswordCubit>(context);
                      log(passwordModel.title);
                      log(passwordModel.password);
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
