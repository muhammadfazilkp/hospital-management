import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/otp_loodin_widget/otp.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/admin_homepage/admin_homepage.dart';
import 'package:flutter_application_1/presentetion/signinpage/signin.dart';
import 'package:flutter_application_1/presentetion/terms_&_condtion/terms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../servises/auth.dart';

class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({
    super.key,
    Key? kay,
  });

  final loginKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Form(
            key: loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Container(
                    height: 290,
                    width: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'asset/medical-workers-analyzing-electronic-record_1262-19834-removebg-preview.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, top: 5),
                      child: Text(
                        ' Login / Welcome',
                        style: GoogleFonts.kadwa(
                            textStyle: const TextStyle(
                                color: Colors.black, fontSize: 20)),
                      ),
                    )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Use your phone number ',
                        style: GoogleFonts.kadwa(
                            textStyle: const TextStyle(
                                fontSize: 13, color: Colors.black38)),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty || value == '') {
                        return 'please enter your number';
                      }
                      if (value.length != 10) {
                        return 'Phone number must be 10 digits.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixText: '+91',
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: Consumer<AuthenticationProvider>(
                      builder: (context, value, child) {
                    return value.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (loginKey.currentState!.validate()) {
                                    value.loading = true;
                                    AuthenticationService.sendPhoneNumber(
                                        phoneController.text, context);
                                  }
                                },
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.grey)),
                                child: Text(
                                  'Login/Signup',
                                  style: GoogleFonts.kadwa(
                                      fontSize: 15, color: Colors.black),
                                )),
                          );
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SigninPage()));
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        child: Text(
                          'Login with password',
                          style: GoogleFonts.kadwa(
                              fontSize: 15, color: Colors.black),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'By Clicking proceed, I agree to the',
                        style: GoogleFonts.kadwa(
                            textStyle: const TextStyle(
                                color: Colors.black, fontSize: 12)),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TermsAndConditionScreen()));
                        },
                        child: Text(
                          'Terms & Condtions',
                          style: GoogleFonts.kadwa(
                              textStyle: const TextStyle(
                                  color: Colors.black, fontSize: 10)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
