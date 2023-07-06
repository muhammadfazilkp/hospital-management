import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/signinpage/login_page.dart';
import 'package:flutter_application_1/presentetion/userprofileupdatepage/userprofile.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:percent_indicator/percent_indicator.dart';

class VeryfyingPageScreen extends StatefulWidget {
  const VeryfyingPageScreen({super.key});

  @override
  State<VeryfyingPageScreen> createState() => _VeryfyingPageScreenState();
}

class _VeryfyingPageScreenState extends State<VeryfyingPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 190,
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginPageScreen()));
                        },
                        icon: Text(
                          'LOGOUT',
                          style: GoogleFonts.kadwa(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ),
                        label: const Icon(
                          Icons.logout,
                          color: Colors.black,
                        )),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'D0  FULL FMH  IN SIMPLIFID WAY',
                      style: veryfeyin,
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 310),
                    child: Text('Verify Account', style: veryfeyin),
                  ),
                  Text(
                      'It is now Mandatory to your FMH to   Continue Using the Service.',
                      style: veryfeyin)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              width: double.infinity,
              color: Colors.blueGrey[100],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' Your  Account verifyi',
                          style: fonts,
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '0%  to Complete',
                          style: fonts,
                        )),
                    LinearPercentIndicator(
                      percent: 0.5,
                      progressColor: Colors.green,
                      barRadius: const Radius.circular(5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        'please complete your clinic profile  to move to ahed',
                        style: fonts,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, top: 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          // ignore: sort_child_properties_last
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 30, 0, 0),
                      child: Text(
                        'In- Clinic  Consulant',
                        style: fonts,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Youer clinic  details  required',
                        style: terms,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       UserProfileUpadtingPage()));
                        },
                        child: Text(
                          'Update',
                          style: fonts,
                        )),
                  ],
                )
              ],
            ),
            box,
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 1),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  // ignore: sort_child_properties_last
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      'Your Location ',
                      style: fonts,
                    ),
                    Text(
                      'Town you live in',
                      style: terms,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Update',
                          style: fonts,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
