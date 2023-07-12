
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int selectIndex = 0;
  static const List<Widget>widgetoptions=[
    Text('Home'),
    Text('Doctors'),
    Text('person')
  ];
  void iteamTapped(int index){
    setState(() {
      selectIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.deepOrangeAccent),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_information_rounded),
          label: 'Doctors',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'Profile',
        ),
      ],
      currentIndex: selectIndex,
      selectedIconTheme: const  IconThemeData(color: Colors.amber),
      onTap: iteamTapped,
    
    );

    return Scaffold(
      body: Center(
      
        child: 
        bottomNavigationBar),
    );
  }
}