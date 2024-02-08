import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Center(
          child: Text(
            'Terms & Conditions',
            style: homep,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [

            Text('Welcome to ConsultEase',style: settings,),
            Text(
              '1. Acceptance of Terms',
              style: view,
            ),
            Text(
              'By accessing and using the ConsultEase System (referred to as "HMS," "System," or "Service"), you agree to comply with and be bound by these Terms and Conditions. If you do not agree with any part of these terms, you must not use the Service.',
              style: settings,
            ),
            box,
            Text(
              '2. Description of Service',
              style: view,
            ),
            Text(
              'The HMS is an online platform designed to facilitate the management of hospital-related activities, including but not limited to patient records, appointment scheduling, billing, and inventory management.',
              style: settings,
            ),
            box,
            Text(
              '3. User Registration',
              style: view,
            ),
            Text(
              'To use certain features of the HMS, you may be required to register an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.',
              style: settings,
            ),
            box,
            Text(
              '4. Data Privacy',
              style: view,
            ),
            Text(
              'We are committed to protecting your privacy and the security of your personal information. Please refer to our Privacy Policy [link to privacy policy] for details on how we collect, use, and protect your data.',
              style: settings,
            ),
            box,
            Text(
              '6. Limitation of Liability',
              style: view,
            ),
            Text(
              'We strive to provide accurate and reliable information through the HMS, but we do not guarantee its accuracy or reliability. We shall not be held liable for any direct, indirect, incidental, consequential, or special damages arising out of or in connection with your use of the HMS.',
              style: settings,
            ),
            box,
            Text(
              '7. Indemnification ',
              style: view,
            ),
            Text(
              '  You agree to indemnify and hold us harmless from any claims, losses, liabilities, damages, costs, and expenses, including attorney s fees, arising from your use of the HMS, violation of these Terms and Conditions, or any applicable laws.  ',
              style: settings,
            )
          ],
        ),
      ),
    );
  }
}
