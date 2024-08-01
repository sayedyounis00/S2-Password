import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/cubit/cubit/add_password_cubit.dart';
import 'package:password_saver/presentation/Views/add_password_screen.dart';
import 'package:password_saver/presentation/Views/password_dashboard.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kPasswordBox);
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddPasswordCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          PasswordDashBoard.id: (context) => const PasswordDashBoard(),
          AddPasswordScreen.id: (context) => const AddPasswordScreen(),
        },
        initialRoute: PasswordDashBoard.id,
      ),
    );
  }
}
