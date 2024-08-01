import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/presentation/Views/add_password_screen.dart';
import 'package:password_saver/presentation/Views/password_dashboard.dart';

void main() async {
    await Hive.initFlutter();
  await Hive.openBox(kBoxName);
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        PasswordDashBoard.id: (context) => const PasswordDashBoard(),
        AddPasswordScreen.id: (context) => const AddPasswordScreen(),
      },
      initialRoute: PasswordDashBoard.id,
    );
  }
}
