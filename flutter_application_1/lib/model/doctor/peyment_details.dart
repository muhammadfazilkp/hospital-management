import 'dart:convert';

class PaymentModel {
    String paymentId;
    //   String amount;
    String userName;
    String doctorName;
    String contact;
    String email;

  PaymentModel({
    required this.paymentId,
    //  required this.amount,
    required this.userName,
    required this.doctorName,
    required this.contact,
    required this.email,
  });

  factory PaymentModel.fromFireStore(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    return PaymentModel(
      paymentId: data['paymentId'],
      //  amount: data['amount'],
      userName: data['userName'],
      doctorName: data['doctorName'],
      contact: data['contact'],
      email: data['email'],
    );
  }

  // String toJson() {
    Map<String, dynamic> toJson(PaymentModel paymentModel) {
    return {
      'paymentId': paymentId,
      // 'amount': amount,
      'userName': userName,
      'doctorName': doctorName,
      'contact': contact,
      'email': email,
    };
  }
}
