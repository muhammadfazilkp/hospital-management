import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_doctor_login/admin_doctor.dart';
import 'package:flutter_application_1/presentetion/splash/splash.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SecondSplashScreen extends StatelessWidget {
  SecondSplashScreen({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Consumer<AdminDoctorLogin>(
                builder: (context, value, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      // height: 150,
                      // width: 3 0,

                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Lottie.asset(
                            'asset/animation/animation_ll7u1avc.json',
                            fit: BoxFit.fill),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      controller: value.loginController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your email address';
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'invalid emil';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.length < 6 ? 'password to short' : null,
                      controller: value.passwordController,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          value.signIn(value.loginController.text.trim(),
                              value.passwordController.text.trim(), context);
                          value.loginController.text = '';
                          value.passwordController.text = '';
                          navigation(context);
                          //doctorlogin@gmail.com
                          //9074957353
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
