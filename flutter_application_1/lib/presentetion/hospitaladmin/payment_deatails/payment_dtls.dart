import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/pyment_provider/rozer_pay.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:provider/provider.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);
    final paymentList = paymentProvider.ditailsList;
    paymentProvider.getAllPayments();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'pymentdeatails',
          style: homep,
        ),
      ),
      body: SafeArea(
        child: Consumer<PaymentProvider>(
          builder: (context, value, child) => ListView.builder(
              itemCount: paymentList.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot<Object?> payment = paymentList[index];

                return Column(
                  children: [
                    box,
                    ListTile(
                      title: Text('userName : ${payment.get('userName')}'),
                      subtitle:
                          Text('doctorName :${payment.get('doctorName')}'),
                      trailing: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.currency_rupee_outlined),
                          label: const Text('300')),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
