import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminDoctorLogin extends ChangeNotifier {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      String errorMessage = _getErrorMessage(e);
      _showErrorSnackbar(errorMessage, context);
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      return error.message ?? 'An error occurred';
    } else {
      return 'An error occurred';
    }
  }

  void _showErrorSnackbar(String errorMessage, BuildContext context) {
    final snackBar = SnackBar(  backgroundColor: Colors.red, content: Text(errorMessage));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
