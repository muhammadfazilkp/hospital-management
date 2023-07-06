import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/core/costom_addmin.dart';
import 'package:flutter_application_1/presentetion/widgets/adding_doctors_cstm/adding_doctors_cstm.dart';

class DoctorsAddingScreen extends StatelessWidget {
  const DoctorsAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              box,
              const Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('asset/wallhaven-l83jjl.jpg'),
                  // maxRadius: double.maxFinite,
                  // backgroundColor: Colors.amber,
                ),
              ),
              box,
              ElevatedButton(
                  onPressed: () {},
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
              Column(
                children: List.generate(
                    5,
                    (index) => CostomeDoctor(
                        controller1: updatingDoctorsControllers[index],
                        hintText1: addingDoctorsHintTextes[index])),
                        
              ),
              ElevatedButton(onPressed: (){} ,style: const  ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)), child: Text('submit',style: fonts,))
            ],
          ),
        ),
      ),
    );
  }
}
