import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'pymentdeatails',
          style: homep,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            box,
            Card(
              child: ListTile(
                title: const Text('Dr.Shinsha'),
                subtitle: const Text('midlaj'),
                trailing: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.currency_rupee_outlined),
                    label: const Text('300')),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Dr.Shinsha'),
                subtitle: const Text('midlaj'),
                trailing: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.currency_rupee_outlined),
                    label: const Text('300')),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Dr.Shinsha'),
                subtitle: const Text('midlaj'),
                trailing: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.currency_rupee_outlined),
                    label: const Text('300')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
