

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';

class SigninPageLogin extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  Future<void> signUp(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> skip(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 7)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePageScreen()),
            (route) => false));
  }

  //Userprofile Updating page //
}
