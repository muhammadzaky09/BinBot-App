import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  static PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(84, 222, 132, 167),
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
    return const Placeholder();
  }
}
