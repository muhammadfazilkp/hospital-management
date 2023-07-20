import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostomeDoctor extends StatelessWidget {
  CostomeDoctor({super.key, this.controller1, this.hintText1, this.calender});

  String? hintText1;
  bool? calender;
  TextEditingController? controller1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller1,
        decoration: InputDecoration(
            labelText: hintText1,
            hintMaxLines: 1,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText1';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
