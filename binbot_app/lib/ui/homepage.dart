import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binbot_app/widget/bottom_navbar.dart';

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
        backgroundColor: const Color.fromARGB(225, 219, 243, 246),
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
          Stack(children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: screenWidth,
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 25, 0, 0),
              child: Text('9.42 Kilogram',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 75, 112),
                    fontFamily: 'Bricolage Grotesque',
                    fontSize: 28.0,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 55, 0, 0),
              child: Text('of waste has been sorted',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 75, 112),
                    fontFamily: 'Bricolage Grotesque',
                    fontSize: 18.0,
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 120, 0, 0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Recycle and Get Rewards',
                    style: TextStyle(color: const Color(0xFF573C04)),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5E4C1))),
            ),
          ]),
          Container(
            child: Column(children: [Text('Linked devices')]),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
