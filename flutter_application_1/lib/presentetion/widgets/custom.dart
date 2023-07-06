
import 'package:flutter/material.dart';
import '../userprofileupdatepage/userprofile.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
  });

 
  UserProfileUpadtingPage userProfileUpadtingPage=UserProfileUpadtingPage();

 
  
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: userProfileUpadtingPage.fkey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 60,
          width: 400,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                labelText: hintText,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            validator: (value) {
            if(value==null || value.isEmpty){
               return 'Please enter $hintText';
            }
            else{
              return null;
            }
             },
          ),
        ),
      ),
    );
  }
}
