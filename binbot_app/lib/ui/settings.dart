import 'package:flutter/material.dart';
import 'package:binbot_app/network/sign_out.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  static PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(225, 219, 243, 246),
      title: const Text('Settings',
          style: TextStyle(
            color: Color.fromARGB(255, 44, 75, 112),
            fontFamily: 'Bricolage Grotesque',
          )),
    );
  }

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            SignOut(context: context).signOutMethod();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 40),
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.red),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
          ),
          child: const Text('Sign Out', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
