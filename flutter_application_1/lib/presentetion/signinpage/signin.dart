import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentetion/signinpage/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninPage extends StatefulWidget {
  const   SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
 
}
 final formkey=GlobalKey<FormState>();
class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                // child: Lottie.asset('asset/lf30_4FGi6N.html',fit: BoxFit.cover),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'asset/young-handsome-physician-medical-robe-with-stethoscope.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
           Padding(
             padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
             child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Sign in',
                  style: GoogleFonts.kadwa( textStyle:  const TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30,
                  ), )
                ),
              ),
           ),
             Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0,left: 19),
                  child: Text(
                    'Log -in using password',
                    style:GoogleFonts.kadwa( textStyle:  const TextStyle(color: Colors.black38,fontSize: 12)),
                  ),
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                       Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: ' Email/Username/phone  ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )),
                        validator: (value) {
                          if(value==null ||value.isEmpty){
                            return 'please compleate process';
      
                          }else{
                           return null;
                          }
                        },
                  ),
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: SizedBox(
                 height: 80,
                 width: double.infinity,
                 child: TextFormField(
                   decoration: InputDecoration(
                       labelText: 'password', border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10)
                       )),
                       validator: (value) {
                         if( value==null || value.isEmpty){
                          return 'please compleate process';
                        }else{
                          return null;
                        }
                       },
                 ),
               ),
             ),
                  ],
                ),
           
          
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                  onPressed: () {
                  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
       usersCollection.add({
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      // Additional fields and values
    });
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPageScreen()));
                   
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
                  ),
                  child:  Text(
                    'Sign in',
                    style: GoogleFonts.kadwa( textStyle: const  TextStyle(fontSize: 15)),
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
             Text(
              'By Clicking proceed, I agree to the',
              style:   GoogleFonts.kadwa(
                textStyle: const  TextStyle(color: Colors.black45,fontSize:12 )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextButton(
                  onPressed: () {},
                  child:  Text(
                    'Terms & Condtions',
                    style: GoogleFonts.kadwa( textStyle: const  TextStyle(color: Colors.black87, fontSize: 10)),
                  )),
            )
          ],
        ),
        ]
      ),
    );
  }
}
