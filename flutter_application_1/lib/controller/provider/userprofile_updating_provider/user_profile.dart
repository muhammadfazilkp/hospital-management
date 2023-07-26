import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/doctor/userprofile/uuser_m.dart';

class UserProfileUpadtingprovider extends ChangeNotifier {

  List<Userprofile>users =[];
  final firebaseFirestore =
      FirebaseFirestore.instance.collection('UserProfile');
      

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController registerYearController = TextEditingController();

  List<String> userProfileUpdateHintTextes = [
    'Mobile Number',
    'Email',
    'username',
    'City ',
    'pincode',
    'registeryear',
  ];

  Future<void> addUserDiteails(
      String phoneNumber,
      String email,
      String username,
      String city,
      String pincode,
      String registeryear) async {
        Map<String,dynamic>adding ={
          'mobilnumber':phoneNumber,
          'email' :email,
          'username':username,
          'city':city,
          'pincode':pincode,
          'registeryear':registeryear

        };
        firebaseFirestore.add(adding);
         
      }

   Future<void> getAllDoctors() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.get();

    final List<Map<String, dynamic>> viewlist =
        querySnapshot.docs.map((doc) => doc.data()).toSet().toList();
    // User.clear();
    for (var data in viewlist) {
      Userprofile user = Userprofile.fromJson(data);
      users.add(user);
      notifyListeners();
    }
  }



}
