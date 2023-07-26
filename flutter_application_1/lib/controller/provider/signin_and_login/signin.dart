import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninPageLogin extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  Future<void> signUp(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  //Userprofile Updating page //
}
