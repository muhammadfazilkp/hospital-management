import 'package:flutter/material.dart';

TextEditingController userNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController yearOldController = TextEditingController();
TextEditingController categoryController = TextEditingController();
TextEditingController placeController = TextEditingController();

List<String> addingDoctorsHintTextes = [
  'username',
  'phonenumber',
  'expiriance',
  'catagory',
  'place',
];
List<TextEditingController> updatingDoctorsControllers = [
  userNameController,
  phoneNumberController,
  yearOldController,
  categoryController,
  placeController
];
