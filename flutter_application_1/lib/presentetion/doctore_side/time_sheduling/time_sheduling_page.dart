// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/slot_checking_provider/slot.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:provider/provider.dart';

class TimeShedulingScreen extends StatelessWidget {
  const TimeShedulingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Consumer<SlotChekingProvider>(
        builder: (context, slote, child) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                  
                    image:  const DecorationImage(image: AssetImage('asset/doctors-concept-illustration_114360-1515.avif'),fit: BoxFit.cover)
                  ),
                ),
              ),
              box,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                   child: TextButton.icon(onPressed: (){

                              slote.selectDate(context);  

                   }, icon:   Center(child: Text('${slote.currentDate.day}/${slote.currentDate.month}/${slote.currentDate.year}',style: homep,)), label:const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.calendar_month,color: Colors.black,)) ),
                  
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Column(

                
                
                children: List.generate(


                 
                  4,
                  (index) => TimeShedulinngCstm(
                      hintText: slote.checkingSlotHintTextes[index],
                      controllerCstm: index == 0
                          ? slote.startingTimecontroller
                          : index == 1
                              ? slote.endingTimeController
                              : index == 2
                                  ? slote.slotsController
                                  : index == 3
                                      ? slote.slotsController
                                         : slote.timeSheduleController),
                ),
              ),
              ElevatedButton(onPressed: (){}, child: const Text('data'))
            ],
          ),
        ),

      ),
    
    ),
   
    );
  }
}

class TimeShedulinngCstm extends StatelessWidget {
  TimeShedulinngCstm(
      {super.key, required this.hintText, required this.controllerCstm});
  String? hintText;
  TextEditingController controllerCstm;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controllerCstm,
        decoration: InputDecoration(
            hintMaxLines: 1,
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
 DateTime currentDate = DateTime.now();

  Future<void>_selctDate(BuildContext context)async{
    final DateTime? pickedeDate= await showDatePicker( 
      context: context,
       initialDate: currentDate, 
       firstDate: DateTime(2023),
        lastDate: DateTime(2050));
        if(pickedeDate !=null && pickedeDate !=currentDate){
         
        }
  }
  
  