import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/userprofile_updating_provider/user_profile.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/bottom_nav_page/bottom_nav.dart';
import 'package:flutter_application_1/presentetion/homepage/home_page.dart';
import 'package:flutter_application_1/presentetion/widgets/custom.dart';
import 'package:provider/provider.dart';

class UserProfileUpadtingPage extends StatelessWidget {
  UserProfileUpadtingPage({super.key});

  final fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: fkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Consumer<UserProfileUpadtingprovider>(
                    builder: (context, value, child) => Column(
                      children: List.generate(
                          value.userProfileUpdateHintTextes.length,
                          (index) => CustomTextFormField(
                                hintText:
                                    value.userProfileUpdateHintTextes[index],
                                controller: index == 0
                                    ? value.mobileNumberController
                                    : index == 1
                                        ? value.emailController1
                                        : index == 2
                                            ? value.userNameController
                                            : index == 3
                                                ? value.cityController
                                                : index == 4
                                                    ? value.pinCodeController
                                                    : value
                                                        .registerYearController,
                              )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: Consumer<UserProfileUpadtingprovider>(
                      builder: (context, userProfileUpadtingprovider, child) =>
                          SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (fkey.currentState!.validate()) {
                                await userProfileUpadtingprovider
                                    .addUserDiteails(
                                        userProfileUpadtingprovider
                                            .mobileNumberController.text
                                            .trim(),
                                        userProfileUpadtingprovider
                                            .emailController1.text,
                                        userProfileUpadtingprovider
                                            .userNameController.text,
                                        userProfileUpadtingprovider
                                            .cityController.text,
                                        userProfileUpadtingprovider
                                            .pinCodeController.text,
                                        userProfileUpadtingprovider
                                            .registerYearController.text);
                                userProfileUpadtingprovider
                                    .getUserDetailsByUID()
                                    .then((value) =>
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BottomNavigatonPage()),
                                            (route) => false));
                              }
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 202, 42, 133)),
                            ),
                            child: Text(
                              'Submit',
                              style: fonts,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
