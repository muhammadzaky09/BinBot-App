import 'package:flutter/material.dart';
import 'package:binbot_app/ui/login.dart';
import 'package:binbot_app/ui/homepage.dart';
import 'package:binbot_app/ui/signup.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Login(),
      '/home': (context) => const Home(),
      '/signup': (context) => const SignUp(),
    },
  ));
}
