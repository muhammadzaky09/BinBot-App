import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:binbot_app/network/sign_in_method.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 185, 223, 186),
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (!RegExp(r'\S+@\S+\.\S+')
                        .hasMatch(emailController.text)) {
                      // Show email validation error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Please enter a valid email'),
                            backgroundColor: Colors.red),
                      );
                    } else if (passwordController.text.length < 6) {
                      // Show password validation error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Password must be at least 6 characters'),
                            backgroundColor: Colors.red),
                      );
                    } else {
                      SignInMethod(
                              emailAddress: emailController.text,
                              password: passwordController.text,
                              context: context)
                          .SignIn();
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        )
        // body: Center(
        //   child: Column(children: <Widget>[
        //     Container(
        //       padding: const EdgeInsets.all(30),
        //       child: Text(
        //         "Welcome to BinBot App",
        //         style: TextStyle(
        //             fontSize: 30,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.green[700],
        //             fontFamily: 'LatoRegular'),
        //       ),
        //     ),

        //   ]),
        );
  }
}
