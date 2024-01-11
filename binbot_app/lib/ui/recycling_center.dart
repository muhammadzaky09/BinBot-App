import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recycling extends StatefulWidget {
  const Recycling({super.key});

  static PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(83, 94, 201, 128),
      title: const Text('Donate & Recycle',
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
  State<Recycling> createState() => _RecyclingState();
}

class _RecyclingState extends State<Recycling> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
