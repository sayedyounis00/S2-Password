import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/cubit/add_password_cubit/add_password_cubit.dart';
import 'package:password_saver/cubit/show_password_cubit/show_password_cubit.dart';
import 'package:password_saver/data/models/image_model.dart';
import 'package:password_saver/data/models/password_model.dart';
import 'package:password_saver/presentation/widgets/custom_text.dart';
import 'package:password_saver/presentation/widgets/custom_button.dart';
import 'package:password_saver/presentation/widgets/custom_text_feild.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});
  static String id = 'addPasswordPage';

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  String? title, pass, email, url, userName;
  final _formKey = GlobalKey<FormState>();
  File? selectedImage;
  final passControler = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passControler.dispose();
    super.dispose();
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
              if (state is AddPasswordFailure) {}
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(text: 'title'),
                          CustomTextFeild(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'thisfeild is required';
                              }
                              if (value.length >= 10) {
                                return 'only accept 10 characters';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'Website/AppName',
                            onChange: (val) {
                              title = val;
                              // log(title!);
                            },
                          ),
                          const CustomText(text: 'Url'),
                          CustomTextFeild(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this feild is required';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'Website Url',
                            onChange: (val) {
                              url = val;
                              // log(title!);
                            },
                          ),
                          const CustomText(text: 'email'),
                          CustomTextFeild(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this feild is required';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'example@mail.com',
                            onChange: (val) {
                              email = val;
                              // log(email!);
                            },
                          ),
                          const CustomText(text: 'user_name'),
                          CustomTextFeild(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this feild is required';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'user_name',
                            onChange: (val) {
                              userName = val;
                              // log(userName!);
                            },
                          ),
                          const CustomText(text: 'password'),
                          CustomTextFeild(
                            controller: passControler,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this feild is required';
                              } else {
                                return null;
                              }
                            },
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
                          onTap: () {
                            passControler.text = generatePassword();
                          },
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
                    // const SizedBox(
                    //   height: 10,
                    // ),
                      const CustomText(text: 'Pick an Image'),
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.grey,
                            ),
                            child: selectedImage != null
                                ? Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: 'ADD PASSWORD',
                      onTaP: () async {
                        if (_formKey.currentState!.validate()) {
                          PasswordModel passwordModel = PasswordModel(
                            title: title!,
                            password:passControler.text.isEmpty?pass!:passControler.text,
                            email: email!,
                            userName: userName!,
                            url: url,
                            image: ImageModel(
                                imageData:
                                    await fileToUint8List(selectedImage!)),
                          );
                          if (context.mounted) {
                            BlocProvider.of<AddPasswordCubit>(context)
                                .addPassword(passwordModel);
                          }
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

// Function to convert File to Uint8List
  Future<Uint8List> fileToUint8List(File file) async {
    return await file.readAsBytes();
  }

  Future pickImage() async {
    var returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  String generatePassword() {
    const int length = 12;
    const String upperCase = 'ABCDEFJKLMNOPQYXWZ';
    // const String lowerCase = 'abcdefjklmnopqyxwz';
    const String numbers = '0123456789';
    const String symbol = '!@#%^&*';
    String chars = '';
    chars += '$upperCase$numbers';
    chars += symbol;
    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }
}
