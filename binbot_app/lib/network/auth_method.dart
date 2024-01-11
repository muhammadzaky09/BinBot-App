/// This file contains the [AuthPage] class, which is a [StatelessWidget] responsible for handling the authentication process.
/// It imports necessary dependencies from the `firebase_auth` and `flutter` packages.
/// The [AuthPage] widget displays different screens based on the user's authentication state.
/// If the user is authenticated, it displays the [Main] widget, otherwise it displays the [Login] widget.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:binbot_app/ui/login.dart';
import 'package:binbot_app/ui/homepage.dart';
import 'package:binbot_app/main_navigation.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Main();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
