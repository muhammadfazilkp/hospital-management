import 'package:flutter/material.dart';

class CostomeDoctor extends StatelessWidget {
  const CostomeDoctor(
      {super.key, required this.controller1, required this.hintText1});
  final String hintText1;
  final TextEditingController controller1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller1,
        decoration: InputDecoration(
            labelText: hintText1,
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
