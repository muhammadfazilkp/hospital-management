import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/doctor/doctor.dart';

class BookingProvider extends ChangeNotifier {
// Map<String,dynamic>? bookings;

  List<Map<String, dynamic>> bookings = [];

  final firestoreInstence = FirebaseFirestore.instance.collection('Mybookings');

  Future<void> addtToFirebase(Doctor doctor, String time) async {
    // String imageUrl = await cloudAdd(profileImage!);
    Map<String, dynamic> adding = {
      'doctor': doctor.doctor,
      'phonenumber': doctor.phonenumber,
      'experience': doctor.experience,
      'category': doctor.category,
      'place': doctor.place,
      'pyment': doctor.pyment,
      'image': doctor.image,
      'uid': doctor.id,
      'time': time
    };
    firestoreInstence.doc('bookings').set(adding);
  }

  Future<void> getAllBookings() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestoreInstence.get();

    final List<Map<String, dynamic>> viewlist =
        querySnapshot.docs.map((doc) => doc.data()).toSet().toList();
    // doctors.clear();
    bookings = viewlist;
    notifyListeners();
  }

  //  Future<void> getBookings() async {
  //   // final QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //   //     await firestoreInstence.get();

  //    final data=FirebaseFirestore.instance.collection('Mybookings').doc('bookings').get();

  //    bookings;
  // //   QuerySnapshot<Map<String, dynamic>> snapshot=await firestoreInstence.doc('bookings').get() as QuerySnapshot<Map<String, dynamic>>;
  // //  return snapshot;
  //     // notifyListeners();
  //   }
}
