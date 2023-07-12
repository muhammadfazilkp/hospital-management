import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class SigninPageLogin extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _verificationId;

  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<ScaffoldState>scaffoldState=GlobalKey<ScaffoldState>();
  Future<void> signUp(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  Future<void> phoneSignin(BuildContext context, String phnoNumber) async {
    await auth.verifyPhoneNumber( 
      phoneNumber: phnoNumber,
      verificationCompleted:   (PhoneAuthCredential credential) async{
        // await auth.signInWithCredential( credential);
        //  Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) =>
        //                             const VeryfyingPageScreen()));
        try {
    // Sign in with the credential
    UserCredential userCredential = await auth.signInWithCredential(credential);


  //    void verifyOTP(BuildContext context, String verificationId, String userOTP) {
  //   auth.verifyOTP(
  //     context: context,
  //     verificationId: verificationId,
  //     userOTP: userOTP,
  //   );
  // }
    
    // User signed in successfully
    User? user = userCredential.user;
    print('User signed in: ${user?.uid}');
    
    // Perform any additional actions after successful sign-in
    // Navigate to a new screen, save user data, etc.
    
  } catch (e) {
    // Error occurred during sign-in
    print('Sign-in error: $e');
    // Handle the error as needed
  }
  
      },
      verificationFailed: (e){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('error')));
        
      },
      codeSent: ( (String verificationId, int? resendToken){
        _verificationId=verificationId;
      }),
      codeAutoRetrievalTimeout: (verificationId) {
        print('verified');
      },
      );

    
  }
}
