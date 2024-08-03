import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_saver/presentation/Views/password_dashboard_screen.dart';
import 'package:password_saver/presentation/widgets/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = 'signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
    late String emailAdress,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.teal, Colors.blue])),
              child: const Padding(
                padding: EdgeInsets.only(left: 40.0, top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: 'Hello',
                        textColor: Colors.white,
                        fontSize: 60,
                        fontfamily: 'DancingScript'),
                    CustomText(
                      text: 'Sign Up to get unlimited password saving ',
                      textColor: Colors.white,
                      fontSize: 15,
                      fontfamily: 'Poppins',
                      maxLines: 2,
                    ),
                  ],
                ),
              )),
          Container(
            height: 480,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: 'Gmail'),
                    TextFormField(
                      onChanged: (email) => emailAdress = email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this feild is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(text: 'Password'),
                    TextFormField(
                      onChanged: (pass) => password = pass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this feild is required';
                        }
                        {}
                        return null;
                      },
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            // final credential =
                             await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: emailAdress,
                              password: password,
                            );
                            if (context.mounted) {
                              Navigator.pushNamed(
                                context,
                                PasswordDashBoard.id,
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              // print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              // print(
                              //     'The account already exists for that email.');
                            }
                          } catch (e) {
                            log(e.toString());
                          }
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 40, top: 50),
                        alignment: Alignment.center,
                        height: 50,
                        width: 300,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                              colors: [Colors.teal, Colors.blue]),
                        ),
                        child: const CustomText(
                            text: 'SIGN UP',
                            fontfamily: 'Poppins',
                            fontSize: 30,
                            textColor: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
