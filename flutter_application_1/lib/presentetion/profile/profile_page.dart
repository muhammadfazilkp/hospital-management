import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: 
         Colors.grey[200],
        title:  Center(child: Text('Profile',style: homep,), ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
              box,
            ProfileCostom( text: 'My Account',icon:  Icon(Icons.person),),
            ProfileCostom( text: 'Notificaton',icon: Icon(Icons.notifications),),
            ProfileCostom(text:'settings' ,icon: Icon(Icons.settings) ,),
            ProfileCostom(text: 'Terms & Condition',icon: Icon(Icons.help_outline_rounded),),
            ProfileCostom(text: 'Log Out',icon: Icon(Icons.logout),)

          ],
        )
      ),


    );
  }
}

class ProfileCostom extends StatelessWidget {
  const ProfileCostom({
      
    super.key, this.text, required this.icon,
  });
 final String? text;
  final     Widget icon;
  
    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const   EdgeInsets.all(5.0),
      child: Container(
        height: 60,
        width: double.infinity,
          // ignore: sort_child_properties_last
          child:   Row(
          children:   [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: icon,
          ),
         
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(text!,style: homep,),
            ),
            const Expanded(child: SizedBox()),
           
          // ignore: prefer_const_constructors
          Padding(
                padding: const EdgeInsets.only(right: 10),
                child: const  Icon(Icons.arrow_forward_ios_outlined),
              )
    
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green[200],
        ),
      ),
    );
  }
}