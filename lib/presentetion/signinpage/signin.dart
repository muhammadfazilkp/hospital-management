import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/signin_and_login/signin.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/second_splash/second_splash.dart';
import 'package:flutter_application_1/presentetion/terms_&_condtion/terms.dart';
import 'package:flutter_application_1/presentetion/userprofileupdatepage/userprofile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SigninPage extends StatefulWidget {
  SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
  FirebaseAuth auth = FirebaseAuth.instance;
}

final SigninPageLogin signinPage = SigninPageLogin();

final formkey = GlobalKey<FormState>();

class _SigninPageState extends State<SigninPage> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            box,
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Lottie.asset('asset/animation/animation_ll7u1avc.json',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('SignUp',
                    style: GoogleFonts.poppins(
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
                    padding: const EdgeInsets.all(7.0),
                    child: Consumer<SigninPageLogin>(
                      builder: (context, value1, child) => SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: TextFormField(
                          controller: value1.passwordController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    passwordVisible == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  )),
                              labelText: 'password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) =>
                              value!.length < 6 ? 'Password to Short' : null,
                          onSaved: (value) => value1.passwordController,
                          obscureText: passwordVisible,
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
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        signinPageLogin.signUp(
                            signinPageLogin.emailController.text,
                            signinPageLogin.passwordController.text);
                        signinPageLogin.emailController.text = '';
                        signinPageLogin.passwordController.text = '';
                        // navigation(context);
                        await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfileUpadtingPage(),
                            ),
                            (route) => false);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.green[100]),
                    ),
                    child: Text(
                      'SignUp',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 15,color: Colors.black)),
                    )),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondSplashScreen()));
                },
                child: Text(
                  'I have alredy account?',
                  style: GoogleFonts.poppins(fontSize: 10, color: Colors.black),
                )),
            Text(
              'By Clicking proceed, I agree to the',
              style: GoogleFonts.kadwa(
                  textStyle:
                      const TextStyle(color: Colors.black45, fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextButton(
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
                            color: Colors.black87, fontSize: 10)),
                  )),
            )
          ],
        ),
      ]),
    );
  }
}
