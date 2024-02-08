

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/model/doctor/peyment_details.dart';
// import 'package:flutter_application_1/presentetion/pyment_screen_rz/pyment.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class PaymentProvider extends ChangeNotifier {
//   var paymentList = [];
//  User? user = FirebaseAuth.instance.currentUser;

//   final firestoreInstence = FirebaseFirestore.instance.collection('payment');
//   List<QueryDocumentSnapshot> ditailsList = [];
   
//   void handlePaymentSuccess(PaymentSuccessResponse response) {
//     String? paymentId = response.paymentId;

//     String name = 'Fathima Hospital';
//     String description = 'doctor';
//     String contact = 'contact';
//     String email = 'contact@protocoderpoint.com';
    

//     PaymentModel paymentModel = PaymentModel(
//       paymentId: paymentId!,
//       // amount: amount.toString(),
//       userName: name,
//       doctorName: description,
//       contact: contact,
//       email: email,
//     );
//     getingResponseId(response);
//     processPayment(paymentModel, paymentId);
//     notifyListeners();

//   }
//    getingResponseId(PaymentSuccessResponse response) {
//     RozzerPayResponse rozzerPayResponse = RozzerPayResponse();
//     rozzerPayResponse.handlePaymentSuccess(response);
//    PaymentModel paymentModel =PaymentModel(paymentId: response.paymentId.toString(), userName: user.cur, doctorName: doctorName, contact: contact, email: email);
//     addPaymentStorage(paymentModel);

//   }

//   void processPayment(PaymentModel paymentMode, String paymentId) {
//     paymentList.add(paymentMode);
//     // addPaymentStorage(paymentMode, );
//     notifyListeners();
//   }

//   Future<void> addPaymentStorage(
//       PaymentModel paymentModel,) async {
//     Map<String, String> paymentMap = {
//       'paymentId':paymentModel. paymentId,
//       'userName': paymentModel.userName,
//       'doctorName': paymentModel.doctorName,
//       'contact': paymentModel.contact,
//       'email': paymentModel.email
//     };
//     await firestoreInstence.add(paymentMap);
//     getAllPayments();
//     notifyListeners();
//   }

//   Future<void> getAllPayments() async {
//     final QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await firestoreInstence.get();

//     for (var doc in querySnapshot.docs) {
//       ditailsList.add(doc);
//     }
//     notifyListeners();

//   }
  
// }
// // //            