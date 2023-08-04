// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/slot_checking_provider/slot.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/doctore_side/widget/time_cstm.dart';
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
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (keyD.currentState!.validate()) {
                              slote.addToDoctorSideDb();

                              Navigator.pop(context);
                            }
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 19, 86, 96))),
                          child: Text(
                            'Submit',
                            style: homep,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// DateTime currentDate = DateTime.now();

// Future<void> _selctDate(BuildContext context) async {
//   final DateTime? pickedeDate = await showDatePicker(
//       context: context,
//       initialDate: currentDate,
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2050));
//   if (pickedeDate != null && pickedeDate != currentDate) {}
// }
