import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: Container(
        child: GNav(
          rippleColor: const Color.fromARGB(255, 144, 142, 142),
          gap: 8,
          activeColor: Color.fromARGB(255, 44, 75, 112),
          color: Colors.grey,
          tabBorderRadius: 40,
          iconSize: 30,
          tabs: [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.search, text: 'Search'),
            GButton(icon: Icons.person, text: 'Profile'),
            GButton(icon: Icons.settings, text: 'Settings')
          ],
          onTabChange: (index) {
            // setState(() {
            //   _selectedIndex = index;
            // });
          },
        ),
      ),
    );
  }
}
