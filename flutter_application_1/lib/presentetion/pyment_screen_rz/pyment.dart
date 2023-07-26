import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../controller/provider/pyment_provider/rozer_pay.dart';

class PymentScreen extends StatefulWidget {
  const PymentScreen({Key? key}) : super(key: key);

  @override
  State<PymentScreen> createState() => PymentScreenState();
}

class PymentScreenState extends State<PymentScreen> {
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: 'Success Payment: ${response.paymentId}',
      timeInSecForIosWeb: 4,
    );
    Provider.of<PaymentProvider>(context, listen: false)
        .handlePaymentSuccess(response);
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

  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();

    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void makePayment() async {
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
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Doctor', style: homep),
            subtitle: Text('Skin Specialist', style: homep),
            trailing: ElevatedButton(
              onPressed: makePayment,
              child: Text('Book Now', style: homep),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _razorpay?.clear(); // Clear the event listeners to prevent memory leaks.
    super.dispose();
  }
}
