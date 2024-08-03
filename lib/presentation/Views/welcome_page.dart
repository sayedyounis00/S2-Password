import 'package:flutter/material.dart';
import 'package:password_saver/presentation/Views/add_password_screen.dart';
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
              child:  Padding(
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
                        isClicked = true;
                        setState(() {
                          
                        });
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
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                            context,
                            AddPasswordScreen.id,
                          );
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
                          onPressed: () {},
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
