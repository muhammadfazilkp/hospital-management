// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/slot_checking_provider/slot.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:provider/provider.dart';

import '../../model/doctor/doctor.dart';

class MyBookingsPage extends StatelessWidget {
 MyBookingsPage({super.key, this.doctor,});


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
        child: Consumer<AdminAddinProvider>(
          
          builder:(context, value, child) => Column(
        
            children: [
              box,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:doctor!=null? Container(
                  height: 200,
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
                          backgroundImage: NetworkImage(doctor!.image),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 70),
                              child: Text(
                                doctor!.doctor,
                                style: homep,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Text(
                                value. doctor!.category,
                                style: homep,
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.fromLTRB(10, 50,5, 5),
                              child: Container(
                                height: 40,
                                
                                
                                
                                
                                                      
                                // ignore: sort_child_properties_last
                                child: Row(
                                  
                                  children: [
                                    const Icon(Icons.calendar_month),
                                    Text(
                                      'Today',
                                      style: homep,
                                    ),
                                    box,
                                    Icon(
                                      Icons.timer_outlined,
                                    ),
                                    Consumer<SlotChekingProvider>(builder:(context, value1, child) => Text(value1.date??'No bookings' 
                                    )

                                  
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
        
        
        
                           
                          ],
                        ),
                        
        
                      ),
                      
        
        
                    ],
                  ),
                ):Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
