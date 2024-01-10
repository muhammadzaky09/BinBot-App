import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:binbot_app/ui/login.dart';
import 'package:binbot_app/ui/homepage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
