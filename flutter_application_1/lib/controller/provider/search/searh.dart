import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/doctor/doctor.dart';

class DoctorProvider with ChangeNotifier {
  List<Doctor> _allDoctors = [];
  List<Doctor> _searchResults = [];

  DoctorProvider() {
    _fetchAllDoctors();
  }

  void _fetchAllDoctors() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();
    
    _allDoctors = snapshot.docs.map((doc) {
      return Doctor.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();

    // Initially, set search results to all doctors
    _searchResults = _allDoctors;
    notifyListeners();
  }

  void searchDoctors(String query) {
    _searchResults = _allDoctors
        .where((doctor) =>
            doctor.doctor.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  List<Doctor> get searchResults => _searchResults;
}
