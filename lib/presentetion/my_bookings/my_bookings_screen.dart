import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/slot_checking_provider/slot.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/model/doctor/doctor.dart';
import 'package:flutter_application_1/presentetion/chat/chat_page.dart';
import 'package:provider/provider.dart';

class MyBookingsPage extends StatelessWidget {
  final Doctor? doctor;

  const MyBookingsPage({Key? key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Center(
          child: Text(
            'My Bookings',
            style: view,
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Mybookings')
              .doc('bookings')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text('No data available.'));
            }

            final data = snapshot.data!.data() as Map<String, dynamic>;

            return Consumer<AdminAddinProvider>(
              builder: (context, value, child) => Column(
                children: [
                  box,
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChattingScreen(
                                    image: value.doctor!.image,
                                    name: value.doctor!.doctor,
                                    categorie: value.doctor!.category,
                                    doctorId: '6746277292'
                            )));
                      },
                      child: GestureDetector(
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 45, 201, 215),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  backgroundImage: NetworkImage(data['image']),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['doctor'],
                                        style: homep,
                                      ),
                                      Text(
                                        data['category'],
                                        style: homep,
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 40,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.today_outlined,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Today',
                                              style: homep,
                                            ),
                                            boxW,
                                            const Icon(
                                              Icons.timer_outlined,
                                              color: Colors.white,
                                            ),
                                            Flexible(
                                              child:
                                                  Consumer<SlotChekingProvider>(
                                                builder:
                                                    (context, value1, child) =>
                                                        Text(
                                                  data['time'] ?? 'No bookings',
                                                  style: homep,
                                                ),
                                                
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Please redy 5 minutes before your time',style: homep,))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
