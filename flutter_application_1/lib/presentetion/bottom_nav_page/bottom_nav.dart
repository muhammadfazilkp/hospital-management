import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';

import 'package:flutter_application_1/presentetion/my_bookings/my_bookings_screen.dart';
import 'package:flutter_application_1/presentetion/profile/profile_page.dart';

class BottomNavigatonPage extends StatefulWidget {
  const BottomNavigatonPage({super.key});

  @override
  State<BottomNavigatonPage> createState() => _BottomNavigatonPageState();
}

int currentIndex = 0;
final List<Widget> pages = [
  const HomePageScreen(),
  MyBookingsPage(),
  const SettingPage()
];

class _BottomNavigatonPageState extends State<BottomNavigatonPage> {
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedItemColor: Colors.white,
        elevation: 30.8,
        mouseCursor: MaterialStateMouseCursor.clickable,
        backgroundColor: Colors.grey[400],
        fixedColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_outlined),
              label: 'My bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
