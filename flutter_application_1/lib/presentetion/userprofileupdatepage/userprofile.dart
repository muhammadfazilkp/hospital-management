import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/core/lists.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';
import 'package:flutter_application_1/presentetion/widgets/custom.dart';

class UserProfileUpadtingPage extends StatelessWidget {
   UserProfileUpadtingPage({super.key});

  final fkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: List.generate(
                      userProfileUpdateHintTextes.length,
                      (index) => CustomTextFormField(
                            hintText: userProfileUpdateHintTextes[index],
                            controller: userProfileUpdateControllers[index],
                          )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageScreen()));
                        
                              // if(fkey.currentState!.validate()){
                              
                                 
                              // }
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                      ),
                      child: Text(
                        'Submit',
                        style: fonts,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
