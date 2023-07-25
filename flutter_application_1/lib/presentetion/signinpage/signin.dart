import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/signin_and_login/signin.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';
import 'package:flutter_application_1/presentetion/signinpage/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
  FirebaseAuth auth = FirebaseAuth.instance;
}

final formkey = GlobalKey<FormState>();

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            box,
          
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 340,
                width: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'asset/man-doctor-woman-nurse-stand-with-patient-card-medical-staff-uniform-study-discuss-examination-result-make-note-therapist-giving-treatment-recommendation-prescription-putting-signature_575670-1316.avif'),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Sign Up',
                    style: GoogleFonts.kadwa(
                      textStyle: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30,
                      ),
                    )),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 19),
                  child: Text(
                    'Log -in using password',
                    style: GoogleFonts.kadwa(
                        textStyle: const TextStyle(
                            color: Colors.black38, fontSize: 12)),
                  ),
                )),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<SigninPageLogin>(
                    builder: (context, signUp, child) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: false,
                          controller: signUp.emailController,
                          decoration: InputDecoration(
                              labelText: ' Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address.';
                            } else if (!RegExp(r'\S+@\S+\.\S+')
                                .hasMatch(value)) {
                              return 'invalid emil';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<SigninPageLogin>(
                      builder: (context, value1, child) => SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: TextFormField(
                          controller: value1.passwordController,
                          decoration: InputDecoration(
                              labelText: 'password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) =>
                              value!.length < 6 ? 'Password to Short' : null,
                          onSaved: (value) => value1.passwordController,
                          obscureText: true,

                        
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
            SizedBox(
              height: 40,
              width: 150,
              child: Consumer<SigninPageLogin>(
                builder: (context, signinPageLogin, child) => ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        signinPageLogin.signUp(
                            signinPageLogin.emailController.text,
                            signinPageLogin.passwordController.text);
                        signinPageLogin.emailController.text = '';
                        signinPageLogin.passwordController.text = '';
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  const HomePageScreen(),), (route) => false);
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blueGrey),
                    ),
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.kadwa(
                          textStyle: const TextStyle(fontSize: 15)),
                    )),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'By Clicking proceed, I agree to the',
              style: GoogleFonts.kadwa(
                  textStyle:
                      const TextStyle(color: Colors.black45, fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Terms & Condtions',
                    style: GoogleFonts.kadwa(
                        textStyle: const TextStyle(
                            color: Colors.black87, fontSize: 10)),
                  )),
            )
          ],
        ),
      ]),
    );
  }
}
