import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binbot_app/widget/bottomNavbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(225, 219, 243, 246),
        title: Text(
            'Hello, ${(FirebaseAuth.instance.currentUser?.email)?.split('@')[0]}',
            style: const TextStyle(color: Color.fromARGB(255, 44, 75, 112))),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
              color: Color.fromARGB(255, 44, 75, 112),
            ),
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 44, 75, 112),
            ),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              width: screenWidth,
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              )),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
