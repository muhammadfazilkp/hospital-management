import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc().snapshots(), // Replace with your document ID
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text('No data available.'));
            }
            
            final paymentDocs = snapshot.data!.data() as Map<String, dynamic>;
            final paymentData = paymentDocs['payments'] as List<dynamic>; 
            // Assuming you have a 'payments' field with an array of payment documents
            
            return ListView.builder(
              itemCount: paymentData.length,
              itemBuilder: (context, index) {
                final payment = paymentData[index] as Map<String, dynamic>;
                final amount = payment['amount'] ?? 'N/A';
                final userId = payment['userid'] ?? 'N/A';
                final timestamp = payment['timestamp']?.toDate() ?? 'N/A';

                return ListTile(
                  title: Text('User ID: $userId'),
                  subtitle: Text('Amount: $amount\nTimestamp: $timestamp'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
