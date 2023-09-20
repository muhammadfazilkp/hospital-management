import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController pymentController = TextEditingController();
  File? profileImage;
  List<Doctor> doctors = [];
  Doctor? doctor;

  //seting the currentdoctor data in the my bookings and chat
  Doctor? currentDoctor;
  Future<void> setCurrentDoctor(Doctor doctor) async {
    currentDoctor = doctor;
    notifyListeners();
  }

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
    'pyment',
  ];

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> addtToFirebase(
      String userName,
      String expriance,
      String catgagory,
      String place,
      String phonenumber,
      String pyment,
      String uid) async {
    String imageUrl = await cloudAdd(profileImage!);
    Map<String, dynamic> adding = {
      'doctor': userName,
      'phonenumber': phonenumber,
      'experience': expriance,
      'category': catgagory,
      'place': place,
      'pyment': pyment,
      'image': imageUrl,
      'uid': uid
    };

    // await firestoreInstence.add(adding);
    firestoreInstence.doc(phonenumber).set(adding);
  }

  Future<void> getAllDoctors() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestoreInstence.get();

    final List<Map<String, dynamic>> viewlist =
        querySnapshot.docs.map((doc) => doc.data()).toSet().toList();
    doctors.clear();
    for (var data in viewlist) {
      doctor = Doctor.fromJson(data);
      doctors.add(doctor!);
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

  Future<void> editDoctor(
    // String docId,
    String userName,
    String expriance,
    String catgagory,
    String place,
    String phonenumber,
    String pyment,
    // String uid
    ) async {
  String imageUrl = await cloudAdd(profileImage!);
  Map<String, dynamic> updatedData = {
    'doctor': userName,
    'phonenumber': phonenumber,
    'experience': expriance,
    'category': catgagory,
    'place': place,
    'pyment': pyment,
    'image': imageUrl,
    // 'uid': uid
  };

  await firestoreInstence.doc(phonenumber).update(updatedData);
}

Future<void> deleteDoctor(String docId) async {
  await firestoreInstence.doc(docId).delete();
}






}
