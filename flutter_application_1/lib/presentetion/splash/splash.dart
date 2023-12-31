import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/userprofile_updating_provider/user_profile.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/bottom_nav_page/bottom_nav.dart';
import 'package:flutter_application_1/presentetion/doctore_side/home_screen/home_screen.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/admin_homepage/admin_homepage.dart';
import 'package:flutter_application_1/presentetion/signinpage/login_page.dart';
import 'package:provider/provider.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

navigation(context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    if (user?.email == 'adminlogin123@gmail.com') {
      //adminlogin123@gmail.com
      //password 9746521767
      return const AdminHomePage();
    } else if (user?.email == 'doctorlogin@gmail.com') {
      return const DoctorHomePage();
    } else if (user == null) {
      return LoginPageScreen();
    } else {
      return const BottomNavigatonPage();
    }
  }));
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
 

  Widget build(BuildContext context) {
    Provider.of<AdminAddinProvider>(context,listen: false).getAllDoctors();
    Provider.of<UserProfileUpadtingprovider>(context,listen: false).getUserDetailsByUID();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'asset/spalash.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
               
                children: [
                  const Text(
                    "The Complete\nHealth \nSolution",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(179, 72, 181, 202),
                        fontSize: 35),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 600,
                      right: 30,
                    ),
                    child: ElevatedButton(
                        onPressed: ( )  {
                          navigation(context);
                        
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //       builder: (context) =>   LoginPageScreen(),
                          //     ),
                          //     (route) => route.isFirst);

                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white54),
                        ),
                        child: Text(
                          'GET START',
                          style: homep,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
