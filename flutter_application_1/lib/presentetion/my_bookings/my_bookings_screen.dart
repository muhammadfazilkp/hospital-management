// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/slot_checking_provider/slot.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:provider/provider.dart';

import '../../model/doctor/doctor.dart';

// ignore: must_be_immutable
class MyBookingsPage extends StatelessWidget {
  MyBookingsPage({
    super.key,
    this.doctor,
  });

  Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Center(
          child: Text(
            'My Bookings ',
            style: view,
          ),
        ),
      ),
      body: SafeArea(
        child:
        StreamBuilder<DocumentSnapshot>( 
        stream: FirebaseFirestore.instance.collection('Mybookings').doc('bookings').snapshots(), 
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
 
          final data = snapshot.data!.data() as Map<String, dynamic>; 
         
          return  Column(
            children: [
              box,
              Padding(
                padding: const EdgeInsets.all(5),
                child: 
                     Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 45, 201, 215),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                backgroundImage: NetworkImage(data['image']),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right:420),
                                    child: Text(
                                      data['doctor'],
                                      style: homep,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 450),
                                    child: Text(
                                     data['category'],
                                      style: homep,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 200),
                                    child: Container(
                                      height: 40,
                                      width: 300,
                                      
                                  
                                      child: Row(
                                        children: [
                                          const Icon(Icons.calendar_month),
                                          Text(
                                            'Today',
                                            style: homep,
                                          ),
                                          boxW,
                                          Icon(
                                            Icons.timer_outlined,
                                          ),
                                          Consumer<SlotChekingProvider>(
                                              builder:
                                                  (context, value1, child) =>
                                                      Text(data['time'] ??
                                                          'No bookings'))
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    
              ),
            ],
          );
        }, 
      ),
        ),
      );
    
  }
}
