import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/doctor/userprofile/uuser_m.dart';

class UserProfileUpadtingprovider extends ChangeNotifier {
  // List<Userprofile>users =[];
  // Map<String,dynamic>?users;
  Userprofile? userProfile;
  final firebaseFirestore =
      FirebaseFirestore.instance.collection('UserProfile');

  // FirebaseAuth userAuth=FirebaseAuth.instance;

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController registerYearController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  List<String> userProfileUpdateHintTextes = [
    'Mobile Number',
    'Email',
    'username',
    'City ',
    'pincode',
    'registeryear',
  ];

  Future<void> addUserDiteails(String phoneNumber, String email,
      String username, String city, String pincode, String registeryear) async {
    User? currentUser = auth.currentUser;
    String uid = currentUser!.uid;

    // if (currentUser != null) {
      Map<String, dynamic> adding = {
        'mobilnumber': phoneNumber,
        'email': email,
        'username': username,
        'city': city,
        'pincode': pincode,
        'registeryear': registeryear,
        'uid': uid
      };
      try {
        await firebaseFirestore.doc(uid).set(adding);
        notifyListeners();
      } catch (e) {
        print('Error adding user details: $e');
      }
    // } else {
    //   throw Exception('User not logged in');
    // }
    notifyListeners();
  }

  Future getUserDetailsByUID() async {
    User? currentUser = auth.currentUser;
    String uid = currentUser!.uid;

    notifyListeners();
    try {
      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.doc(uid).get();

      if (querySnapshot.exists) {
        Map<String, dynamic> userProfiledata = querySnapshot.data()!;
        userProfile = Userprofile.fromJson(userProfiledata);
      } else {
        // User details not found
        return null;
      }
    } catch (e) {
      // Handle any exceptions that occurred during Firestore read operation
      print('Error getting user details: $e');
      return null;
    }
  }
}
