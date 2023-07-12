import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/doctor/doctor.dart';
import 'package:image_picker/image_picker.dart';

class AdminAddinProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController yearOldController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  File? profileImage;
  List<Doctor> doctors = [];

  Future<void> getphoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    } else {
      File file = File(photo.path);

      profileImage = file;
      notifyListeners();
    }
  }

  final firestoreInstence = FirebaseFirestore.instance.collection('Doctors');
//hinttext
  List<String> addingDoctorsHintTextes = [
    'username',
    'phonenumber',
    'expiriance',
    'catagory',
    'place',
  ];

  Future<void> addtToFirebase(String userName, String expriance,
      String catgagory, String place, String phonenumber) async {
    String imageUrl = await cloudAdd(profileImage!);
    Map<String, dynamic> adding = {
      'doctor': userName,
      'phonenumber': phonenumber,
      'experience': expriance,
      'category': catgagory,
      'place': place,
      'image': imageUrl
    };

    await firestoreInstence.add(adding);
  }

  Future<void> getAllDoctors() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestoreInstence.get();

    final List<Map<String, dynamic>> viewlist =
        querySnapshot.docs.map((doc) => doc.data()).toSet().toList();
    doctors.clear();
    for (var data in viewlist) {
      Doctor doctor = Doctor.fromJson(data);
      doctors.add(doctor);
      notifyListeners();
    }
  }

  Future<String> cloudAdd(File file) async {
    final Reference storegeref = FirebaseStorage.instance
        .ref()
        .child('image/${DateTime.now().millisecond}');
    final UploadTask uploadTask = storegeref.putFile(file);
    TaskSnapshot snap = await uploadTask;
    final String dowloadUrl = await snap.ref.getDownloadURL();
    // imageUri=dowloadUrl;
    notifyListeners();
    return dowloadUrl;
  }
}
