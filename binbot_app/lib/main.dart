import 'package:flutter/material.dart';
import 'package:binbot_app/ui/login.dart';
import 'package:binbot_app/ui/homepage.dart';
import 'package:binbot_app/ui/sign_up.dart';
import 'package:binbot_app/network/auth_method.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const AuthPage(),
      '/login': (context) => const Login(),
      '/home': (context) => const Home(),
      '/signup': (context) => const SignUp(),
    },
  ));
}
