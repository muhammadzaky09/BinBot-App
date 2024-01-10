import 'package:flutter/material.dart';
import 'package:binbot_app/network/sign_up_method.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        centerTitle: true,
        title: const Text('Sign Up', style: TextStyle(color: Colors.white)),
      ),
      body: Column(children: <Widget>[
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        // ignore: sized_box_for_whitespace
        Container(
          width: 350,
          child: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              labelText: 'Name',
              hintText: 'Enter your Name',
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // email
        Container(
          width: 350,
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // ignore: sized_box_for_whitespace

        Container(
          width: 350,
          child: TextField(
            controller: passwordController,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // ignore: sized_box_for_whitespace
        Container(
          width: 350,
          child: TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              labelText: 'Confirm Password',
              hintText: 'Confirm your password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(emailController.text)) {
              // Show email validation error
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Please enter a valid email'),
                    backgroundColor: Colors.red),
              );
            } else if (passwordController.text.length < 6) {
              // Show password length error
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content:
                        Text('Password should be at least 6 characters long'),
                    backgroundColor: Colors.red),
              );
            } else if (passwordController.text !=
                confirmPasswordController.text) {
              // Show password match error
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Passwords do not match'),
                    backgroundColor: Colors.red),
              );
            } else {
              // Proceed with the sign-up process
              SignUpMethod(
                emailAddress: emailController.text,
                password: passwordController.text,
                name: nameController.text,
                context: context,
              ).SignUp();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text('Sign Up'),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Already have an account?'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ]),
    );
  }
}
