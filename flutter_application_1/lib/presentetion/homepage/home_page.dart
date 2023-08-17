import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/userprofile_updating_provider/user_profile.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/chat/chat_page.dart';
import 'package:flutter_application_1/presentetion/doctore_side/home_screen/home_screen.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/admin_homepage/admin_homepage.dart';
import 'package:flutter_application_1/presentetion/search_page/search_screen.dart';
import 'package:flutter_application_1/servises/greeting.dart';
import 'package:provider/provider.dart';
import '../widgets/listtile_costome.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

bool _showFirstImage = true;
late Timer _timer;
Greetings greetings = Greetings();

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _showFirstImage = !_showFirstImage;
        if (!mounted) {
          _timer.cancel();
          return;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is being disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<AdminAddinProvider>(
              builder: (context, addingprovider, child) => FutureBuilder(
                    future: addingprovider.getAllDoctors(),
                    builder: (context, snapshot) => Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                greetings.greeting(),
                                style: greet,
                              ),
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Consumer<UserProfileUpadtingprovider>(
                                  builder: (context, userDitail, child) {
                                final isAuthenticated =
                                    FirebaseAuth.instance.currentUser != null;

                                if (isAuthenticated &&
                                    userDitail.userProfile != null) {
                                  return Text(
                                    'Welcome, ${userDitail.userProfile!.username}',
                                    style: view,
                                  );
                                } else {
                                  return Text(
                                      ' Welcome to ConsultEase', // Display a default message
                                      style: view);
                                }
                              }),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchPage(),
                                  ));
                            },
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // ignore: prefer_const_constructors
                              child: Padding(
                                padding: const EdgeInsets.only(left: 325),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // color: Colors.amber,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(_showFirstImage
                                        ? 'asset/9233a9bf83cb10537e8dbe32224739f7.jpg'
                                        : 'asset/d96044445b34de730fb33959fa2506bd.jpg'))),
                            height: 300,
                            width: double.infinity,
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(
                                10,
                                140,
                                10,
                                60,
                              ),
                            ),
                          ),
                        ),
                        box,
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green[200],
                                    ),
                                    child: TextButton.icon(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminHomePage()));
                                         
                                        },
                                        icon: const Icon(
                                          Icons.local_hospital_outlined,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        label: Text(
                                          'General',
                                          style: homep,
                                        ))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green[200],
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DoctorHomePage()));
                                        },
                                        child: Text(
                                          'Cold',
                                          style: fonts,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green[200],
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                          FirebaseAuth auth =
                                              FirebaseAuth.instance;

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChattingScreen(
                                                        image: addingprovider
                                                            .doctor!.image,
                                                        name: addingprovider
                                                            .doctor!.doctor,
                                                        categorie:
                                                            addingprovider
                                                                .doctor!
                                                                .category,
                                                        doctorId: auth
                                                            .currentUser!.uid),
                                              ));
                                        },
                                        child: Text(
                                          'More',
                                          style: fonts,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green[200],
                                      ),
                                      child: TextButton.icon(
                                          onPressed: () async {
                                            // FirebaseAuth auth =
                                            //     FirebaseAuth.instance;
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             DoctorSideChattingScreen(
                                            //                 name: Provider.of<UserProfileUpadtingprovider>(context,listen: false).userProfile!.username!,
                                            //                 userid: auth
                                            //                     .currentUser!
                                            //                     .uid)));
                                          },
                                          icon: const Icon(
                                            Icons.horizontal_split_sharp,
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            'More',
                                            style: homep,
                                          ))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        box,
                        Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Our Docters',
                                    style: homep,
                                  ),
                                )),
                          ],
                        ),
                        const Divider(),
                        const ListileCustome(),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
