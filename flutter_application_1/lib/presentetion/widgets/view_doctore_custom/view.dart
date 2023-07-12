import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';

class Vewdoctors extends StatelessWidget {
  const Vewdoctors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminAddinProvider>(
      builder:(context, viewProvider, child) =>  Expanded(
        child: ListView.builder(
          itemCount: viewProvider.doctors.length,
          itemBuilder: (context, index) {
          return Card(
            color: Colors.grey,
            child: ListTile(
              
              leading:  CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(viewProvider.doctors[index].image),
              ),
              title: Text(
                viewProvider.doctors[index].doctor,
                style: homep,
              ),
              subtitle: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                     Text(
                    viewProvider.doctors[index].category,
                    style: homep,
                  ),
                  Text(viewProvider.doctors[index].experience,style: homep,),
                  Text(viewProvider.doctors[index].phonenumber,style: homep,),
                  Text(viewProvider.doctors[index].place)
                  ],
                  
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
