// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/slot_checking_provider/slot.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final keyD = GlobalKey<FormState>();

class TimeShedulingScreen extends StatelessWidget {
  const TimeShedulingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SlotChekingProvider provider = Provider.of<SlotChekingProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Consumer<SlotChekingProvider>(
          builder: (context, slote, child) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: keyD,
              child: Column(
                children: [
                  boxW,
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage(
                                  'asset/doctors-concept-illustration_114360-1515.avif'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                          onPressed: () {
                            slote.selectDate(context);
                          },
                          icon: Center(
                              child: Text(
                            '${slote.currentDate.day}/${slote.currentDate.month}/${slote.currentDate.year} ',
                            style: homep,
                          )),
                          label: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Select your time ',
                          style: terms,
                        )),
                  ),
                  Column(
                    children: List.generate(
                      2,
                      (index) => TimeShedulinngCstm(
                          hintText: slote.checkingSlotHintTextes[index],
                          controllerCstm: index == 0
                              ? slote.startingTimecontroller
                              : slote.endingTimeController),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (keyD.currentState!.validate()) {
                          slote.addToDoctorSideDb();

                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Submit',
                        style: homep,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _selectTime(BuildContext context, SlotChekingProvider provider,
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
    final formattedTime = DateFormat('h:mm a').format(selectedTime);
    print(formattedTime);
  }
}

class TimeShedulinngCstm extends StatelessWidget {
  TimeShedulinngCstm(
      {super.key, required this.hintText, required this.controllerCstm});
  String? hintText;
  TextEditingController controllerCstm;
  @override
  Widget build(BuildContext context) {
    return Consumer<SlotChekingProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () => _selectTime(context, value, controllerCstm),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: TextFormField(
              // style: const TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
              enabled: false,
              keyboardType: TextInputType.text,
              controller: value.timeController,
              decoration: InputDecoration(
                  hintText: 'Enter Time',
                  labelText: controllerCstm == value.startingTimecontroller
                      ? '${value.startingHour} : ${value.startingMinute}'
                      : '${value.endingHour} : ${value.endingMinute}',
                  hintMaxLines: 1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
        ),
      ),
    );
  }
}

DateTime currentDate = DateTime.now();

Future<void> _selctDate(BuildContext context) async {
  final DateTime? pickedeDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050));
  if (pickedeDate != null && pickedeDate != currentDate) {}
}
