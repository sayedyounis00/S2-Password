import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/cubit/add_password_cubit/add_password_cubit.dart';
import 'package:password_saver/cubit/show_password_cubit/show_password_cubit.dart';
import 'package:password_saver/data/models/image_model.dart';
import 'package:password_saver/data/models/password_model.dart';
import 'package:password_saver/presentation/Views/add_password_screen.dart';
import 'package:password_saver/presentation/Views/password_dashboard_screen.dart';
import 'package:password_saver/presentation/Views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(PasswordModelAdapter());
  Hive.registerAdapter(ImageModelAdapter());

  // Open the box
  await Hive.openBox<PasswordModel>(kPasswordBox);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => ShowPasswordCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          PasswordDashBoard.id: (context) => const PasswordDashBoard(),
          AddPasswordScreen.id: (context) => const AddPasswordScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
        },
        initialRoute: PasswordDashBoard.id,
      ),
    );
  }
}
