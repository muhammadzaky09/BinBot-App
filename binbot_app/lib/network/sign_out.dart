import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignOut {
  late BuildContext context;
  SignOut({required this.context});

  void signOutMethod() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      // Handle the exception if needed.
    }
  }
}
