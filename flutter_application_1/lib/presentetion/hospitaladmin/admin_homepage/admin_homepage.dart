
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/add_doctorscreen/docters_adding.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/payment_deatails/payment_dtls.dart';
import 'package:flutter_application_1/presentetion/signinpage/signin.dart';



class AdminHomePage extends StatelessWidget {
  const AdminHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('HOSPITAL ADDMINISTRATION',style: homep,),

      ),

      body: SafeArea(child:
       GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, index) {
        String names=checkIndex(index);
        return AdminPageCostom(text: names,index: index,);
               
      },
    )
      ));
  }

   String checkIndex(int index){
    if(index==0){
      return 'Add Doctors';
    }else if(index==1){
      return 'Peyment Details';
    }else if(index==2){
      return 'View Doctors';
    }else if(index==3){
      return 'View Patients ';
    }else if(index==4){
      return 'View feedback';
    }else if(index==5){
      return 'Time Shedule';
    }else{
      return 'ggh';
    }
  }
}



class AdminPageCostom extends StatelessWidget {
   AdminPageCostom({super.key, required this.text, required this.index});
   String text;
   int index;

  List gestureSelection=[ const DoctorsAddingScreen(), const PaymentDetailsPage()];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.grey,
        child: GestureDetector(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>gestureSelection[index]));
          },
          child: TextButton.icon(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>gestureSelection[index]));
              }, icon: const Icon(Icons.medication_outlined,color: Colors.black,), label: Text(text,style: fonts,)),
        ),
      ),
    );
  }
}
