import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/widgets/adding_doctors_cstm/adding_doctors_cstm.dart';
import 'package:provider/provider.dart';

class DoctorsAddingScreen extends StatelessWidget {
  DoctorsAddingScreen({super.key});
  final CostomeDoctor costomeDoctor = CostomeDoctor();
  final dkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<AdminAddinProvider>(
            builder: (context, provider, child) => Column(
              children: [
                box,
                Center(
                  child: CircleAvatar(
                    radius: 88,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 77,
                      backgroundImage: provider.profileImage != null
                          ? FileImage(File(provider.profileImage!.path))
                          : const AssetImage('asset/images.png')
                              as ImageProvider,
                    ),
                  ),
                ),
                box,
                ElevatedButton(
                    onPressed: () {
                      provider.getphoto();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.blueGrey),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                    child: Text(
                      'Add Profile',
                      style: homep,
                    )),
                Form(
                  key: dkey,
                  child: Consumer<AdminAddinProvider>(
                    builder: (context, value, child) => Column(
                      children: List.generate(
                          6,
                          (index) => CostomeDoctor(
                              controller1: index == 0
                                  ? value.userNameController
                                  : index == 1
                                      ? value.phoneNumberController
                                      : index == 2
                                          ? value.yearOldController
                                          : index == 3
                                            ?value.categoryController
                                              :index==4
                                                ?value.placeController
                                                :value.pymentController,
                                              // ? value.categoryController
                                              // : value.placeController,
                              hintText1: value.addingDoctorsHintTextes[index])),
                    ),
                  ),
                ),
                Consumer<AdminAddinProvider>(
                  builder: (context, value1, child) => ElevatedButton(
                      onPressed: () async {
                        if (dkey.currentState!.validate()) {
                          await value1.addtToFirebase(
                            value1.userNameController.text.trim(),
                            value1.yearOldController.text.trim(),
                            value1.categoryController.text.trim(),
                            value1.placeController.text.trim(),
                            value1.phoneNumberController.text.trim(),
                            value1.pymentController.text.trim()
                          

                          );
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      child: Text(
                        'submit',
                        style: fonts,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
