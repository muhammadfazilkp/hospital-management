import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/doctor/doctor_side.dart';
import 'package:intl/intl.dart';

class SlotChekingProvider extends ChangeNotifier {
  DateTime currentDate = DateTime.now();

  List<DoctorSide> view = [];
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

  // SlotChekingProvider(int index);
  Future<void> selectDate(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      currentDate = pickedDate ?? currentDate;
      notifyListeners();
    }
  }

  Future<void> selectTime(BuildContext context, SlotChekingProvider provider,
      TextEditingController controllerCstm) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: provider.selectedTime,
    );

    if (picked != null) {
      provider.updateSelectedTime(picked, controllerCstm);
      final now = DateTime.now();
      final selectedTime =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
    
    }
  }


  /// converting the am and pm 
  String convertTo12HourFormat(String time24Hour) {
  try {
    final time =
        TimeOfDay.fromDateTime(DateTime.parse("2023-08-02 $time24Hour"));
    final format =
        DateFormat.jm(); // 'jm' formats time in 12-hour format with AM/PM
    return format.format(DateTime(2023, 8, 2, time.hour, time.minute));
  } catch (e) {
    return 'Error';
  }
}


//  TimeOfDay selectedTime = TimeOfDay.now();
  String startingHour = '';
  String endingHour = '';
  String startingMinute = '';
  String endingMinute = '';
  TextEditingController timeController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? date;

  getDate(String data){
    date=data;
    notifyListeners();
  }

  void updateSelectedTime(
      TimeOfDay newTime, TextEditingController controllerCstm) {
    selectedTime = newTime;
    if (controllerCstm == startingTimecontroller) {
      startingHour = selectedTime.hour.toString();
      startingMinute = selectedTime.minute.toString();
    } else if (controllerCstm == endingTimeController) {
      endingHour = selectedTime.hour.toString();
      endingMinute = selectedTime.minute.toString();
    }
    notifyListeners();
  }

  String get formattedTime {
    return startingHour + ' : ' + endingMinute;
  }

  final firebaseFirestore = FirebaseFirestore.instance.collection('DoctorSide');
  Future<void> addToDoctorSideDb(
      // String startingtime, String endingTime, String slotes, times
      ) async {
    getAllDoctorSide();
    Map<String, dynamic> addingDb = {
     
      'startingtime': '${startingHour}:${startingMinute}',
      ' endingTime': '${endingHour}:${endingMinute}',
      
     
    };
    await firebaseFirestore.add(addingDb);
  }

  Future<void> getAllDoctorSide() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.get();
    final List<Map<String, dynamic>> doctorside =
        querySnapshot.docs.map((doc) => doc.data()).toSet().toList();

    for (var data in doctorside) {
      DoctorSide doctorSide = DoctorSide.fromJson(data);
      view.add(doctorSide);
      notifyListeners();
    }
  }
}
