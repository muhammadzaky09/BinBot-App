import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binbot_app/network/firestore_retrieval.dart';

class Wallet extends StatefulWidget {
  Wallet({super.key});

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
            child: Column(
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
    return FutureBuilder<double>(
      future: FirestoreRetrieval().getWalletAmount(),
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 44, 75, 112)));
        } else if (snapshot.hasError) {
          return const Text(
            'IDR0.00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          );
        } else if (snapshot.hasData) {
          return Text(
            'IDR ${(snapshot.data)?.toInt()}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          );
        }

        // Add a return statement or throw an exception here
        return Container(); // Replace with appropriate widget or throw statement
      },
    );
  }
}

class WalletAccount extends StatelessWidget {
  const WalletAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
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
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(children: <Widget>[
        const Icon(Icons.pets,
            color: Color(0xFFFE6B8B)), // Replace with appropriate icon
        const SizedBox(width: 4),
        FutureBuilder<int>(
          future: FirestoreRetrieval().getRecpoints(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 44, 75, 112)));
            } else if (snapshot.hasError) {
              return const Text(
                '0',
                style: TextStyle(
                  color: Colors.black, // Text color inside the white container
                  fontSize: 16.0,
                ),
              );
            } else if (snapshot.hasData) {
              return Text(
                '${(snapshot.data)} RecPoints',
                style: const TextStyle(
                  color: Colors.black, // Text color inside the white container
                  fontSize: 16.0,
                ),
              );
            }

            // Add a return statement or throw an exception here
            return Container(); // Replace with appropriate widget or throw statement
          },
        ),
      ]),
    );
  }
}
