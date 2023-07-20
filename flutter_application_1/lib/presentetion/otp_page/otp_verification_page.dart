import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/otp_authentication_pv/otp_auth.dart';
import 'package:flutter_application_1/controller/provider/signin_and_login/signin.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';
import 'package:flutter_application_1/presentetion/veryfypage/veryfeying_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:provider/provider.dart';

class OtpVerificationpScreen extends StatefulWidget {
  final String verificationId;

  const OtpVerificationpScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<OtpVerificationpScreen> createState() => _OtpVerificationpScreenState();
}

class _OtpVerificationpScreenState extends State<OtpVerificationpScreen> {
  Timer? _timer;

  final int _timerDuration = 60;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final provider =
          Provider.of<OtpAuthenticationRepository>(context, listen: false);
      if (provider.currentSeconds < _timerDuration) {
        provider.incrementSeconds();
      } else {
        _timer?.cancel();
        provider.setTimerFinished();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpcontroller = OtpFieldController();
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 0, 0),
                child: Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        'Enter your OTP code',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        top: 15,
                      ),
                      child: Text(
                        'Enter the otp code send to you',
                        style: GoogleFonts.kadwa(
                            textStyle: const TextStyle(
                                color: Colors.black45, fontSize: 13)),
                      ),
                    ),
                  ),
                  box
                ],
              ),
              Row(
               
                children: [
                  Consumer<OtpAuthenticationRepository>(
                      builder: (context, provider, _) {
                    return Expanded(
                      child: OtpPinField(
                        onSubmit: (String text) async {
                          bool verificationSuccess =
                              await provider.verifyOtp(context, text);
                          if (verificationSuccess) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageScreen()));
                          }
                        },
                        onChange: (String text) {
                          provider.clearErrorMessage();
                        },
                        textInputAction: TextInputAction.done,
                        otpPinFieldStyle: const OtpPinFieldStyle(
                          defaultFieldBorderColor:
                              Color.fromARGB(255, 0, 27, 177),
                        ),
                        maxLength: 6,
                      ),
                    );
                  }),
                ],
              ),
              Center(
                child: Text(
                  'we have sent you one-time password',
                  style: homep,
                ),
              ),
              Center(
                child: Text('to your number'),
              ),
              Consumer<OtpAuthenticationRepository>(
                builder: (context, providerO, _) {
                  if (providerO.errorMessage != null) {
                    return Text(
                      providerO.errorMessage!,
                      style: homep,
                    );
                  } else if (providerO.currentSeconds > 0) {
                    final reaminingseconds =
                        _timerDuration - providerO.currentSeconds;

                    return Text(
                      'please enter your OTP $reaminingseconds before time out',
                      style: terms,
                    );
                  } else {
                    return box;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 40,
                  width: 160,
                  child: ElevatedButton(
                      onPressed: () {
                        Provider.of<SigninPageLogin>(context, listen: false)
                            .phoneSignin(context, otpcontroller.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VeryfyingPageScreen()));
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.grey),
                      ),
                      child: Text(
                        'Proceed',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didnt receive the OTP?  ',
                    style: fonts,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'RESEND IT',
                        style: textbutton,
                      ))
                ],
              ),
              Text(
                'By clicking  proceed , i agree to the',
                style: terms,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    ' Terms & Conditions',
                    style: terms,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
