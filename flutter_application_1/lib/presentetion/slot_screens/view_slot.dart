import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/model/doctor/doctor_side.dart';

class SloteCheckingScreen extends StatelessWidget {
  const SloteCheckingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  DoctorSide categoryProducts = DoctorSide.fromJson(
                      categorrySnapshot.docs[index].data()
                          as Map<String, dynamic>);
                  //     final startTime = DateFormat('h:mm a').format(categoryProducts.strtingtime.toDate());
                  // final endTime = DateFormat('h:mm a').format(categoryProducts.endingTime.toDate());

                  return Card(
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(
                        categoryProducts.strtingtime.toString(),
                        style: homep,
                      ),
                      subtitle: Text(
                        categoryProducts.endingTime.toString(),
                        style: homep,
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.local_hospital_outlined)),
                    ),
                  );
                },
                itemCount: categorrySnapshot.docs.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text('No products'),
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
