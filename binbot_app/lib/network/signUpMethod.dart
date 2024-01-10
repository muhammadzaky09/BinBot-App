import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpMethod {
  String emailAddress = '';
  String password = '';
  String name = '';
  late BuildContext context;

  SignUpMethod(
      {required this.emailAddress,
      required this.password,
      required this.name,
      required this.context});

  void SignUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          )
          .then((result) => {result.user?.updateDisplayName(name)});
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
