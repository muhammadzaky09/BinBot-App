import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// add ui pages here
import 'package:binbot_app/ui/homepage.dart';
import 'package:binbot_app/ui/settings.dart';
import 'package:binbot_app/ui/wallet.dart';
import 'package:binbot_app/ui/recycling_center.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0; // The index of the current selected tab
  final PageController _pageController =
      PageController(); // Create a page controller

  PreferredSizeWidget? _getAppBar() {
    switch (_selectedIndex) {
      case 0: // For Home
        return Home.appBar(context);
      case 1: // For Recycling
        return Recycling.appBar(context);
      case 2: // For Wallet
        return Wallet.appBar(context);
      case 3: // For Search
        return Settings.appBar(context);
      default:
        return null; // No AppBar or a default AppBar
    }
  }

  void _onPageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController
        .dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageSelected,
        children: [
          Home(),
          Recycling(),
          Wallet(),
          Settings(),
          // Add other pages...
        ],
      ),
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        pageController: _pageController,
        onPageSelected: _onPageSelected, // Add this callback
      ),
    );
  }
}

// bottom navbar widget
class BottomNavbar extends StatefulWidget {
  final int selectedIndex;
  final PageController pageController;
  final Function(int) onPageSelected; // Add this callback

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.pageController,
    required this.onPageSelected,
  });

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
      child: GNav(
        rippleColor: const Color.fromARGB(255, 144, 142, 142),
        gap: 8,
        activeColor: const Color.fromARGB(255, 44, 75, 112),
        color: Colors.grey,
        tabBorderRadius: 40,
        iconSize: 30,
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.recycling_rounded, text: 'Recycle'),
          GButton(icon: Icons.wallet, text: 'Wallet'),
          GButton(icon: Icons.settings, text: 'Settings')
        ],
        onTabChange: (index) {
          widget.onPageSelected(index); // Call the callback here
          widget.pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
