import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/doctor/doctor_side.dart';

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

//  TimeOfDay selectedTime = TimeOfDay.now();
  String startingHour = '';
  String endingHour = '';
  String startingMinute = '';
  String endingMinute = '';
  TextEditingController timeController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

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
      // 'pickDate':pickedDate,
      'startingtime': '${startingHour}:${startingMinute}',
      ' endingTime': '${endingHour}:${endingMinute}',
      // ' slotes': '',
      // 'times': '',
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
