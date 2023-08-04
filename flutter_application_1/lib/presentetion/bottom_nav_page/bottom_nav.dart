import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentetion/doctore_side/home_screen/home_screen.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/admin_homepage/admin_homepage.dart';
import 'package:flutter_application_1/presentetion/profile/profile_page.dart';

class BottomNavigatonPage extends StatefulWidget {
  const BottomNavigatonPage({super.key});

  @override
  State<BottomNavigatonPage> createState() => _BottomNavigatonPageState();
}

int currentIndex=0;
final List<Widget> pages = [
  const  HomePageScreen(),
  const  AdminHomePage(),
  const ProfilePage()
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
                icon: Icon(Icons.medical_information), label: 'Doctors'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: 'profile')
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
