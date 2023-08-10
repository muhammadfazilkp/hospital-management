import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/my_booking_provider/my_booking.dart';
import 'package:flutter_application_1/controller/provider/otp_loodin_widget/otp.dart';
import 'package:flutter_application_1/controller/provider/slot_checking_provider/slot.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/model/doctor/doctor.dart';
import 'package:flutter_application_1/model/doctor/doctor_side.dart';
import 'package:flutter_application_1/presentetion/my_bookings/my_bookings_screen.dart';
import 'package:flutter_application_1/presentetion/pyment_screen_rz/pyment.dart';
import 'package:provider/provider.dart';

class SloteCheckingScreen extends StatelessWidget {
  const SloteCheckingScreen({super.key, required this.doctor,});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    RozzerPayResponse rozzerPayResponse = RozzerPayResponse();
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('DoctorSide')
            // .where('type', isEqualTo: type)
            .snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              QuerySnapshot categorrySnapshot = snapshot.data as QuerySnapshot;
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .snapshot(categorrySnapshot);
              Provider.of<AuthenticationProvider>(context, listen: false).f =
                  List<bool>.generate(
                      snapshot.data!.docs.length, (index) => false);
              return Consumer<AdminAddinProvider>(
                builder:(context, doc, child) =>  Column(

                // var doctor = doc.doctors[index];
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        // color:Colors.amber,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(doctor.image),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    box,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              doctor.doctor,
                              style: view,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text(
                              doctor.category,
                              style: view,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hospitality is almost impossible to teachn Its all about hiring the right people \nHospital are about healing  ',
                        style: booking,
                      ),
                    ),
                    box,
                    Text(
                      'Today available Times',
                      style: view,
                    ),
                    const Divider(),
                    Consumer<SlotChekingProvider>(
                      builder: (context, timeConvert, child) => Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            DoctorSide categoryProducts = DoctorSide.fromJson(
                                categorrySnapshot.docs[index].data()
                                    as Map<String, dynamic>);
                            Provider.of<AuthenticationProvider>(context,
                                    listen: false)
                                .getTime(categoryProducts);
                
                            final startTime =
                                categoryProducts.strtingtime as String;
                            final endTime = categoryProducts.endingTime as String;
                
                            String formattedStartTime =
                                timeConvert.convertTo12HourFormat(startTime);
                            String formattedEndTime =
                                timeConvert.convertTo12HourFormat(endTime);
                
                            Provider.of<AuthenticationProvider>(context,
                                    listen: false)
                                .index = index;
                            // Check if the current time slot is booked
                
                            List<String> bookedTimeSlots = [];
                
                            Provider.of<AuthenticationProvider>(context,
                                        listen: false)
                                    .isSlotBooked =
                                bookedTimeSlots.contains(startTime);
                
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, bottom: 5, top: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Consumer<AuthenticationProvider>(
                                    builder: (context, timecheck, child) =>
                                        GestureDetector(
                                      onTap: () {
                                        timecheck.boolCheck(index);
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                      
                                        // ignore: sort_child_properties_last
                                        child: Column(
                                          children: [
                                            Text(
                                              formattedStartTime.toString(),
                                              style: homep,
                                            ),
                                            box,
                                            Text(
                                              formattedEndTime.toString(),
                                              style: homep,
                                            ),
                                          ],
                                        ),
                                      
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width: 1,
                                            color: timecheck.f[index] == true
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: categorrySnapshot.docs.length,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 30),
                      child: Consumer<AuthenticationProvider>(
                        builder: (context, valueIndex, child) => SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async {
                              await  rozzerPayResponse.makePayment();
                
                                // print("${valueIndex.categoryProducts?.strtingtime.toString()}:${valueIndex.categoryProducts?.endingTime.toString()}");
                                DoctorSide categoryProducts = DoctorSide.fromJson(
                                    categorrySnapshot.docs[valueIndex.index!]
                                        .data() as Map<String, dynamic>);
                
                                 Provider.of<SlotChekingProvider>(context,listen: false).getDate("${categoryProducts.strtingtime.toString()}:${categoryProducts.endingTime.toString()}");       
                                // print(
                                //     "${categoryProducts.strtingtime.toString()}:${categoryProducts.endingTime.toString()}");4
                              
                                await  Provider.of<BookingProvider>(context,listen: false).addtToFirebase(doctor,"${categoryProducts.strtingtime.toString()}:${categoryProducts.endingTime.toString()}");

                                await  Provider.of<BookingProvider>(context,listen: false).getAllBookings();
                                
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyBookingsPage(doctor: doctor),));
                              },
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10))),
                                backgroundColor:
                                    const MaterialStatePropertyAll(Colors.green),
                              ),
                              child: Text('book now', style: booking)),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: Text(
                  'sorry no slotes!!!',
                  style: homep,
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      )),
    );
  }
}
