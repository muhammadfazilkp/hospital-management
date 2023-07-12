import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/signin_and_login/signin.dart';
import 'package:flutter_application_1/presentetion/splash/splash.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'presentetion/bottom_nav_page/bottom_nav.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
     runApp( const Myapp());

}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => SigninPageLogin(), ),
        ChangeNotifierProvider(create: (context)=>AdminAddinProvider())
      ],
      child: MaterialApp(
        title: 'Hospital Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         
         scaffoldBackgroundColor: Colors.white
        ),
       home:   const SpalashScreen(),
      ),
    );
  }
}
