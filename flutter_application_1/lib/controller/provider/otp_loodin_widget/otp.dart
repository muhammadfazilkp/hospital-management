import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../../model/doctor/doctor_side.dart';

class AuthenticationProvider with ChangeNotifier {
  bool _loading = false;
   int? index;
   DoctorSide? categoryProducts;
   QuerySnapshot? categorrySnapshot;
   

List<bool> f=[];
  bool get loading => _loading;
   bool isSlotBooked=false;
   

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  boolCheck(int index1){
    int length=f.length;
    f.clear();
    f=List<bool>.generate(length, (index) => false);
    f[index1]=!f[index1];
    index=index1;
    notifyListeners();
  }

  getTime(DoctorSide? category){
    categoryProducts=category;
     notifyListeners();
  }

  snapshot(QuerySnapshot? snapshot){
    categorrySnapshot=snapshot;
    // notifyListeners();
  }
  
  // notifyListeners() 
    
  
  

  

  

  //time checking ths slote

   
    
  
}