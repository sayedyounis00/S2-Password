import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/widgets/custom_add_data_feild.dart';
import 'package:password_saver/widgets/custom_text.dart';

class AddPasswordScreen extends StatelessWidget {
  const AddPasswordScreen({super.key});
  static String id = 'addPasswordPage';

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
          child: Column(
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
              const CustomAddDataFeild(
                text: 'Name',
                feildText: 'Website/AppName',
              ),
              const CustomAddDataFeild(
                text: 'Url',
                feildText: 'Website Url',
              ),
              const CustomAddDataFeild(
                text: 'email',
                feildText: 'example@mail.com',
              ),
              const CustomAddDataFeild(
                text: 'USERNAME',
                feildText: 'user name',
              ),
              const CustomAddDataFeild(
                text: 'password',
                feildText: 'Password',
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
                          border: Border.all(color: kPrimaryColor, width: 2),
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
              GestureDetector(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
