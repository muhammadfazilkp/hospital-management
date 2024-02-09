import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';

import 'package:flutter_application_1/presentetion/my_bookings/my_bookings_screen.dart';
import 'package:flutter_application_1/presentetion/profile/profile_page.dart';

class BottomNavigatonPage extends StatefulWidget {
  const BottomNavigatonPage({Key? key});

  @override
  State<BottomNavigatonPage> createState() => _BottomNavigatonPageState();
}

int currentIndex = 0;
final List<Widget> pages = [
  const HomePageScreen(),
  const MyBookingsPage(),
  const SettingPage()
];

class _BottomNavigatonPageState extends State<BottomNavigatonPage> {
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(color: Colors.black),
            unselectedItemColor: Colors.black,
            elevation: 30.8,
            mouseCursor: MaterialStateMouseCursor.clickable,
            backgroundColor: Colors.blueGrey,
            fixedColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.news,
                  color: Colors.white,
                ),
                label: 'My bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
