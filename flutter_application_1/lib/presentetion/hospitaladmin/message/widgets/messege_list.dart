import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/message/chating_screen.dart';
import 'package:intl/intl.dart';

class MessageListDoctors extends StatelessWidget {
  const MessageListDoctors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final formattedDate = DateFormat('MMMM d').dateOnly;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('doctors')
          .where('doctorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('appointmentDate', isEqualTo: formattedDate)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final documents = snapshot.data!.docs;
          // final uniqueDoctorIds = <String>{};
          if (documents.isEmpty) {
            return const Text(
              'No Messages/',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            );
          }

          final groupedAppointments = groupedMessageByUser(documents);

          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 7,
              ),
              itemCount: groupedAppointments.length,
              itemBuilder: (context, index) {
                final appointmentGroup = groupedAppointments[index];
                final name = appointmentGroup[0]['userName'];
              
        
                final userId = appointmentGroup[0]['userId'];

                return Container(
                  color: Colors.white,
                  child: ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DoctorSideChattingScreen(
                        userid: userId,
                      
                        name: name,
                      );
                    })),
                    // subtitle: Text(
                    //   gender,
                    //   style: GoogleFonts.outfit(),
                    // ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    // leading: CircleAvatar(
                    //   maxRadius: 25,
                    //   // minRadius: 10,
                    //   // backgroundImage: NetworkImage(image),
                    // ),
                    title: Text(
                      name,
                      style: homep,
                    ),
                    trailing: const Icon(Icons.east),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  List<List<QueryDocumentSnapshot>> groupedMessageByUser(
      List<QueryDocumentSnapshot> appointments) {
    final Map<String, List<QueryDocumentSnapshot>> groupedMap = {};
    for (final appointment in appointments) {
      final userId = appointment['userName'];
      if (groupedMap.containsKey(userId)) {
        groupedMap[userId]!.add(appointment);
      } else {
        groupedMap[userId] = [appointment];
      }
    }
    return groupedMap.values.toList();
  }
}
