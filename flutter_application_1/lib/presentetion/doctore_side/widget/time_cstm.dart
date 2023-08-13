// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/slot_checking_provider/slot.dart';

class TimeShedulinngCstm extends StatelessWidget {
  TimeShedulinngCstm(
      {super.key, required this.hintText, required this.controllerCstm});
  String? hintText;
  TextEditingController controllerCstm;
  @override
  Widget build(BuildContext context) {
    return Consumer<SlotChekingProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () => value.selectTime(context, value, controllerCstm),
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
