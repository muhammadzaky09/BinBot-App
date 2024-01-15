import 'package:flutter/material.dart';
import 'package:binbot_app/network/update_profile_photo.dart';
import 'package:binbot_app/network/update_email.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  // This will hold the image file after it's selected or taken by the user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(84, 222, 132, 167),
        title: const Text('Profile Settings',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Bricolage Grotesque',
            )),
        actions: [
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
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            UpdateProfilePhoto(),
            SizedBox(height: 24),
            Text(
              'Update Email',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 18),
            ChangeEmail(),
            // You can add more settings widgets here
          ],
        ),
      ),
    );
  }
}
