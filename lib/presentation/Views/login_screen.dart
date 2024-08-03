import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_saver/presentation/Views/password_dashboard_screen.dart';
import 'package:password_saver/presentation/Views/sign_up_screen.dart';
import 'package:password_saver/presentation/widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'WelcomePage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isClicked = false;
  late String emailAdress, password;
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
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: isClicked ? 'Good Choise' : 'Hello',
                        textColor: Colors.white,
                        fontSize: 60,
                        fontfamily: 'DancingScript'),
                    const CustomText(
                      text: 'Sign in to get unlimited password saving ',
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
                      onChanged: (val) {
                        emailAdress = val;
                        isClicked = true;
                        setState(() {});
                      },
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
                      onChanged: (value) {
                        password = value;
                      },
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            // final credential =
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailAdress,
                              password: password,
                            );
                            if(context.mounted)Navigator.pushNamed(context, PasswordDashBoard.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              log('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              log('Wrong password provided for that user.');
                            }
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
                            text: 'SIGN IN',
                            fontSize: 30,
                            textColor: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CustomText(text: 'Don\'t have a account ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, SignUpScreen.id);
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ),
                      ],
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
