import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  static PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(84, 222, 132, 167),
      title: const Text('Waste Wallet',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Bricolage Grotesque',
          )),
      actions: [
        IconButton(
          icon: const Icon(
            CupertinoIcons.bell_fill,
            color: Colors.black,
          ),
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onPressed: () {
            // handle the press
          },
        ),
      ],
    );
  }

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFE6B8B), // Start color of gradient
                  Color(0xFFFF8E53), // End color of gradient
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.6), // Shadow color
                  offset: const Offset(0, 8),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                WalletAmount(),
                SizedBox(height: 10),
                RecPoints(),
                SizedBox(height: 20),
                WalletAccount(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WalletAmount extends StatelessWidget {
  const WalletAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'IDR232.500',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class WalletAccount extends StatelessWidget {
  const WalletAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Waste Bank\nBank Sampah Sleman',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        height: 1.5, // Line height
      ),
    );
  }
}

class RecPoints extends StatelessWidget {
  const RecPoints({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 8.0), // Add some padding
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(children: <Widget>[
        Icon(Icons.pets,
            color: Color(0xFFFE6B8B)), // Replace with appropriate icon
        SizedBox(width: 4),
        Text(
          '56 RecPoints',
          style: TextStyle(
            color: Colors.black, // Text color inside the white container
            fontSize: 16.0,
          ),
        ),
      ]),
    );
  }
}
