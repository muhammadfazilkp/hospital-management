import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';

class SloteCheckingScreen extends StatefulWidget {
  const  SloteCheckingScreen({super.key});

  @override
  State<SloteCheckingScreen> createState() => _SloteCheckingScreenState();
}

class _SloteCheckingScreenState extends State<SloteCheckingScreen> {
  DateTime currentDate = DateTime.now();

  Future<void>_selctDate(BuildContext context)async{
    final DateTime? pickedeDate= await showDatePicker( 
      context: context,
       initialDate: currentDate, 
       firstDate: DateTime(2023),
        lastDate: DateTime(2050));
        if(pickedeDate !=null && pickedeDate !=currentDate){
          setState(() {
            currentDate=pickedeDate;
          });
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.grey[200],
        title: Text('CHCEK YOUR SLOTES',style: homep,),
        
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(currentDate.toString()),
      ElevatedButton(onPressed: () => _selctDate(context) , child: Text('select the date',style: homep,))
       
        ],
      ),


    );
  }
}