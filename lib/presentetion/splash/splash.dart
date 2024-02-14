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
    Provider.of<AdminAddinProvider>(context, listen: false).getAllDoctors();
    Provider.of<UserProfileUpadtingprovider>(context, listen: false)
        .getUserDetailsByUID();
    doubleCheck(context);
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white
          //   image: DecorationImage(

          //       image: AssetImage(
          //           'asset/happy-doctor-holding-clipboard-with-patients_1098-2176.avif'),
          //       fit: BoxFit.scaleDown),
          // ),

          ),
      child: Center(
        child: Text(
          'data',
          style: homep,
        ),
      ),
    ));
  }
}

void doubleCheck(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 6)).then(
    (value) => navigation(context),
  );
}
