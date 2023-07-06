import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentetion/splash/splash.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
     runApp( const Myapp());

}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Hospital Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
       scaffoldBackgroundColor: Colors.white
      ),
     home: const  SpalashScreen(),
    );
  }
}
