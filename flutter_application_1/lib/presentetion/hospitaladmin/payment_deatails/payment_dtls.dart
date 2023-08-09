import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/core.dart';

class AdminPaymentDetailsScreen extends StatelessWidget {
  Future<List<Map<String, dynamic>>> getPaymentData() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    final paymentDocs = snapshot.docs;
    return paymentDocs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details',style: homep,),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getPaymentData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const  Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final paymentDocs = snapshot.data;
            return ListView.builder(
              itemCount: paymentDocs?.length,
              itemBuilder: (context, index) {
                final paymentData = paymentDocs![index];
                final amount = paymentData['amount'];
                final userId = paymentData['userid'];
                final timestamp = paymentData['timestamp'];

                return ListTile(
                  title: Text('User ID: $userId'),
                  subtitle: Text('Amount: $amount\nTimestamp: $timestamp'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
