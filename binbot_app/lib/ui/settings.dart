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
        const SizedBox(height: 20),
        SettingsButton(),
        const SizedBox(height: 20),
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

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding around the button
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Background color
          foregroundColor: Colors.black, // Text and icon color
          elevation: 4.0, // Shadow elevation
          minimumSize: Size(350, 60), // Width and Height of the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          shadowColor: Colors.grey, // Shadow color
          // Add padding between the icon and the text
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // Increase the icon size
        ),
        onPressed: () {
          // Your onPressed function here
          Navigator.pushNamed(context, '/profile_settings');
        },
        icon: const Icon(Icons.person), // Profile icon
        label: const Text('Profile'), // Button text
      ),
    );
  }
}
