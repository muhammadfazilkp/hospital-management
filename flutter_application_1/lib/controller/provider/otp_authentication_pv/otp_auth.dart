import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpAuthenticationRepository extends ChangeNotifier {
  final String verificationId;
  OtpAuthenticationRepository(this.verificationId);
  int _currentSeconds = 0;
  String? _errorMessage;
  int get currentSeconds => _currentSeconds;
  String? get errorMessage => _errorMessage;

  void incrementSeconds() {
    _currentSeconds++;
    notifyListeners();
  }

  void setTimerFinished() {
    _currentSeconds = 0;
    notifyListeners();
  }

  Future<bool> verifyOtp({required BuildContext context,required String userOtp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOtp,
      );
      await auth.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException {
      _errorMessage = 'Error verifying OTP. Please enter correctly.';
      notifyListeners();
      return false;
    }
  }

  void clearErrorMessage() {
    _errorMessage = '';
    notifyListeners();
  }
}
