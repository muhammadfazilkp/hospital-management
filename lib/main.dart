
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_doctor_login/admin_doctor.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/custome_provider/custom.dart';
import 'package:flutter_application_1/controller/provider/my_booking_provider/my_booking.dart';
import 'package:flutter_application_1/controller/provider/otp_authentication_pv/otp_auth.dart';
import 'package:flutter_application_1/controller/provider/search/searh.dart';
import 'package:flutter_application_1/controller/provider/signin_and_login/signin.dart';
import 'package:flutter_application_1/controller/provider/userprofile_updating_provider/user_profile.dart';
import 'package:flutter_application_1/presentetion/splash/splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'controller/provider/otp_loodin_widget/otp.dart';
import 'controller/provider/slot_checking_provider/slot.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  // FirebaseAdMob.instance.initialize(appId: appId);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SigninPageLogin(),
        ),
        ChangeNotifierProvider(create: (context) => AdminAddinProvider()),
        ChangeNotifierProvider(
          create: (context) => OtpAuthenticationRepository('jfhgf'),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SlotChekingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProfileUpadtingprovider(),
        ),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(create: (context) => AdminDoctorLogin()),
        ChangeNotifierProvider(create: (context)=>CustomProvider()),
      ],
      child: MaterialApp(
        title: 'ConsultEase',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: const SpalashScreen(),
      ),
    );
  }
}
