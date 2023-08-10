// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/signinpage/login_page.dart';
import 'package:flutter_application_1/presentetion/terms_&_condtion/terms.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green[200],
          // title: Text('Logout'),
          content: Text(
            'Do you want to logout?',
            style: homep,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPageScreen()),
                    (route) => false);
              },
              child: Text(
                'Logout',
                style: homep,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
            Text('dfd'),


          box,
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const TermsAndConditionScreen())),
              child: Container(
                height: 50,
                width: double.infinity,
                      
                child: Row(children: [
                  boxW,
                  const  Icon(Icons.contrast_outlined,color: Colors.white,),
                  boxW,
                  Text('Terms & conditions',style: homep,)
                ],),
                decoration: BoxDecoration(
                   color: Colors.green[200],
                      
                  borderRadius: BorderRadius.circular(10)
                      
                ),
              ),
            ),
          ),
          box,


          GestureDetector(
            onTap: () {
              _showLogoutDialog(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    boxW,
                    // ignore: prefer_const_constructors
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    boxW,
                    Text(
                      'Logout',
                      style: homep,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
