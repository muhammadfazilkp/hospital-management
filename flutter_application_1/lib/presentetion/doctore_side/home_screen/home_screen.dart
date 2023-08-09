
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/doctore_side/time_sheduling/time_sheduling_page.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/message/chating_screen.dart';

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

 
  @override
  Widget build(BuildContext context) {
     List<String>images=[
    'asset/medical-workers-analyzing-electronic-record_1262-19834-removebg-preview.png',
    'asset/privacy-policy-concept-illustration_114360-7853.avif',
    'asset/privacy-policy-concept-illustration_114360-7853.avif',
    'asset/medical-workers-analyzing-electronic-record_1262-19834-removebg-preview.png',
  ];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Doctor Homepage'),
      // ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 8,
                

              ),
              itemCount: 4,
              itemBuilder: ( BuildContext context, index) {
                String names=chcekIndex(index);
               return GridItem(title: names,image: images[index],
               index: index,
               );
              },
            ),
      
        ),
      );
    
  }
}

// ignore: must_be_immutable
class GridItem extends StatelessWidget {
  final String title;
  final String image;
  // final String content;
  int index;


  GridItem({
    required this.title,
    required this.index, required this.image,
    
  });
  List cardSelector=[
   
    const  HomePageScreen(),
     const  TimeShedulingScreen(),
      DoctorSideChattingScreen(name: "", userid: ''),
    

  ];


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => cardSelector[index],));
      },
      child: Container(
        decoration:  BoxDecoration(
            boxShadow:const [
              BoxShadow(
                color: Colors.white38,
                blurRadius: 0,
                spreadRadius: 0,
                offset: Offset(1, 1),
              ),
            ],
            image: DecorationImage(
                image: AssetImage(
                    image))),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Text(title, style: homep),
            ),
            const SizedBox(height: 10.0),
            // Text(content),
          ],
        ),
      ),
    );
  }
}



String chcekIndex(int index){
  if(index==0){
    return 'View paisent';
  }else if(index==1){
    return 'Time Shedule';
  } else if(index==2){
    return ' Feedbacks';
  }else{
    return 'chats';
  }
}