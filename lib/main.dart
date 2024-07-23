import 'package:flutter/material.dart';
import 'package:password_saver/Views/add_password_screen.dart';
import 'package:password_saver/Views/password_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        PasswordDashBoard.id:(context)=>const PasswordDashBoard(),
        AddPasswordScreen.id:(context)=>const AddPasswordScreen(),
      }, // This trailing comma makes auto-formatting nicer for build methods.
      initialRoute:PasswordDashBoard.id ,
    );
  }
}
