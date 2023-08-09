import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/model/doctor/doctor.dart';
import 'package:flutter_application_1/presentetion/slot_screens/view_slot.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/search/searh.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Column(
          children: [
            box,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) {
                  // Use the provider to perform the search
                  Provider.of<DoctorProvider>(context, listen: false)
                      .searchDoctors(query);
                },
                decoration:   InputDecoration(
                  hintText: 'search catagories/doctors\'',
                  suffixIcon: const  Icon(Icons.search),
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                   ),
                  
                ),
              ),
            ),
            Expanded(
              child: Consumer<DoctorProvider>(
                builder: (context, doctorProvider, _) {
                 
                  // final searchResults = doctorProvider.searchResults;

                    List<Doctor> searchResults = doctorProvider.searchResults;
                    if(searchResults.isEmpty){
                      return Center(
                        child: Lottie.asset('asset/animation/animation_ll3ltiuj (1).json'),
                      );
                    }

                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final doctor = searchResults[index];

                      return GestureDetector(
                        onTap: () {
                          
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SloteCheckingScreen(
                            doctor: doctor
                            ))
                            );
                        },
                         child:ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(doctor.image),),
                   title: Text(doctor.doctor),
                          subtitle: Text( doctor.category),
                          // Add other relevant data//
                ) ,
                        
                      );

                        
                    }
                  

                    
                  );
                },
               
              ),
            ),
          ],
        ),
      ),
    );
  }
}
