import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/signinpage/login_page.dart';

class SpalashScreen extends StatelessWidget {
  const SpalashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'asset/young-handsome-physician-medical-robe-with-stethoscope.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
                children: [
                  const Text(
                    "The Complete\nHealth \nSolution",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white30,
                        fontSize: 35),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 600,
                      right: 30,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => LoginPageScreen(),
                              ),
                              (route) => route.isFirst);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white54),
                        ),
                        child: Text(
                          'GET START',
                          style: homep,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
