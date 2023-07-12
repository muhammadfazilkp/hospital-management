import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/signin_and_login/signin.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/veryfypage/veryfeying_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class OtpVerificationpScreen extends StatelessWidget {
  const OtpVerificationpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpcontroller=OtpFieldController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                  OTPTextField(
                   controller:otpcontroller ,
                    length: 4,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 45,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                  ),
                ],
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
                       Provider.of<SigninPageLogin>(context,listen: false).phoneSignin(context,otpcontroller.toString() ); 
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
