
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPaymentDetailsScreen extends StatelessWidget {
  const AdminPaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Admin Payment Details'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return  const CircularProgressIndicator();
          }

          final paymentDocs = snapshot.data?.docs;

          return ListView.builder(
            itemCount: paymentDocs?.length,
            itemBuilder: (context, index) {
              final paymentData = paymentDocs?[index].data();
              final amount = paymentData;
              final userId = paymentData;
              final timestamp = paymentData;

              return ListTile(
                title: Text('User ID: $userId'),
                subtitle: Text('Amount: $amount\nTimestamp: $timestamp'),
              );
            },
          );
        },
      ),
    );
  }
}