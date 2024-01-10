import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInMethod {
  String emailAddress = '';
  String password = '';
  late BuildContext context;
  SignInMethod(
      {required this.emailAddress,
      required this.password,
      required this.context});

  void SignIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
