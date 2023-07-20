import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});


FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: ElevatedButton(onPressed: ()async{
        final userCredential=await auth.createUserWithEmailAndPassword(email: "fazil@gmail.com", password: "12345678");
        print(userCredential);
      }, child: const Text("SAMPLE")),),
    );
  }
}