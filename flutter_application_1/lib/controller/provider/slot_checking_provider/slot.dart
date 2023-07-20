import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/doctor/doctor_side.dart';

class SlotChekingProvider extends ChangeNotifier {
  DateTime currentDate = DateTime.now();
  List<DoctorSide>view=[];
  List<String> checkingSlotHintTextes = [
    //   'pick the date',
    'starting time ',
    'ending time',
    'slotes',
    'times',
  ];

  // TextEditingController picktheDateController = TextEditingController();
  TextEditingController startingTimecontroller = TextEditingController();
  TextEditingController endingTimeController = TextEditingController();
  TextEditingController slotsController = TextEditingController();
  TextEditingController timeSheduleController = TextEditingController();
   DateTime? pickedDate;
  Future<void> selectDate(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      currentDate = pickedDate??currentDate;
      notifyListeners();
    }
  }
   final firebaseFirestore =FirebaseFirestore.instance.collection('DoctorSide');
 Future<void>addToDoctorSideDb(  String pickDate,int startingtime, int endingTime, String slotes, times)async{
  Map<String,dynamic>addingDb={
    'pickDate':pickedDate,
    'startingtime' : startingtime,
   ' endingTime' : endingTime,
    ' slotes': slotes,
    'times' : times,
  };
  await firebaseFirestore.add(addingDb);
 }
 Future<void>getAllDoctorSide()async{
  final QuerySnapshot<Map<String,dynamic>>querySnapshot=
  await firebaseFirestore.get();
  final List<Map<String,dynamic>>doctorside=
  querySnapshot.docs.map((doc) => doc.data()).toSet().toList();

     for(var data in doctorside){
      DoctorSide doctorSide= DoctorSide.fromJson(data);
      view.add(doctorSide);
      notifyListeners();
     }
 }


}
