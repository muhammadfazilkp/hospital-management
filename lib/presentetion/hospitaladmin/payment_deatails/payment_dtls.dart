import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Payment Ditails',
            style: homep,
          ),
        ),
        backgroundColor: Colors.green[200],
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          // Replace with your document ID
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return Center(
                  child: Text(
                'No data available.',
                style: homep,
              ));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final document = snapshot.data!.docs[index];
                final payment = document.data() as Map<String, dynamic>;
                final amount = payment['amount'] ?? 'N/A';
                final userId = payment['userid'] ?? 'N/A';
                final timestamp = payment['timestamp']?.toDate() ?? 'N/A';

                return Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    title: Text(
                      'User ID: $userId',
                      style: homep,
                    ),
                    subtitle: Text(
                      'Amount: $amount\nTimestamp: $timestamp',
                      style: homep,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
