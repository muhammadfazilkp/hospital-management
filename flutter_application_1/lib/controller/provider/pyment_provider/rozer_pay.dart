

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/doctor/peyment_details.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider extends ChangeNotifier {
  var paymentList = [];
  final firestoreInstence = FirebaseFirestore.instance.collection('Payment');
  List<QueryDocumentSnapshot> ditailsList = [];

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    String? paymentId = response.paymentId;

    String name = 'Fathima Hospital';
    String description = 'doctor';
    String contact = 'contact';
    String email = 'contact@protocoderpoint.com';

    PaymentModel paymentModel = PaymentModel(
      paymentId: paymentId!,
      // amount: amount.toString(),
      userName: name,
      doctorName: description,
      contact: contact,
      email: email,
    );
    processPayment(paymentModel, paymentId);
    notifyListeners();
  }

  void processPayment(PaymentModel paymentMode, String paymentId) {
    paymentList.add(paymentMode);
    addPaymentStorage(paymentMode, paymentId);
    notifyListeners();
  }

  Future<void> addPaymentStorage(
      PaymentModel paymentModel, String paymentId) async {
    Map<String, String> paymentMap = {
      paymentId: paymentId,
      'userName': paymentModel.userName,
      'doctorName': paymentModel.doctorName,
      'contact': paymentModel.contact,
      'email': paymentModel.email
    };
    await firestoreInstence.add(paymentMap);
    getAllPayments();
    notifyListeners();
  }

  Future<void> getAllPayments() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestoreInstence.get();

    for (var doc in querySnapshot.docs) {
      ditailsList.add(doc);
    }
    notifyListeners();

  }
  
}
//            