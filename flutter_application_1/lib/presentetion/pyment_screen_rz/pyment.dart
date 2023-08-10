import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/slot_checking_provider/slot.dart';
import 'package:flutter_application_1/model/doctor/doctor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RozzerPayResponse {
  User? user = FirebaseAuth.instance.currentUser;

  Razorpay razorpay = Razorpay();

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: 'Success Payment: ${response.paymentId}',
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 4,
    );
    if (user != null) {
      FirebaseFirestore.instance 
          .collection('users')
          .doc(user?.uid)
          .collection('Payment')
          .add({
         'userid':user!.uid,   
        'amount': response.paymentId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: 'Error ${response.code}- ${response.message}',
      timeInSecForIosWeb: 4,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: 'Wallet ${response.walletName}',
      timeInSecForIosWeb: 4,
    );
  }

  makePayment() async {
    var options = {
      'key': 'rzp_test_Djkb2wONIbXz3v',
      'amount': 20000,
      'name': 'Fathima Hospital',
      'description': 'doctors',
      'prefill': {
        'contact': '+919074957353',
        'email': 'contact@protocoderpoint.cpm',
      },
    };

    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    } catch (e) {
      debugPrint(e.toString());
    }
  }




}