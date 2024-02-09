import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/userprofile_updating_provider/user_profile.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/google_ads/google_mob.dart';
import 'package:flutter_application_1/presentetion/search_page/search_screen.dart';
import 'package:flutter_application_1/servises/greeting.dart';
import 'package:provider/provider.dart';
import '../widgets/listtile_costome.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Greetings greetings = Greetings();
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
                            child: TextField(
                              enabled: false,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                hintText: 'Serch Your Doctor....',
                                prefixIcon: const Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: CarouselSlider(
                            items: [
                              // Add your carousel items here
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'asset/9233a9bf83cb10537e8dbe32224739f7.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),

                                  // color: Colors.green,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'asset/d96044445b34de730fb33959fa2506bd.jpg'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              // Add more items as needed
                            ],
                            options: CarouselOptions(
                              height: 200,
                              aspectRatio: 15 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              // onPageChanged: callbackFunction,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        box,
                        // const  Padding(
                        //   padding: EdgeInsets.only(left: 20),
                        //   child: SingleChildScrollView(
                        //     scrollDirection: Axis.horizontal,
                        //     child: Row(
                        //       children: [
                        //         CustomeScroll(
                        //           icon: Icon(Icons.more_horiz),
                        //           text: Text('d'),
                        //         ),
                        //         boxW,
                        //         CustomeScroll(
                        //           icon: Icon(Icons.more_horiz),
                        //           text: Text('data'),
                        //         ),
                        //         boxW,
                        //         CustomeScroll(
                        //           icon: Icon(Icons.more_horiz),
                        //           text: Text('data'),
                        //         ),
                        //         boxW,
                        //         CustomeScroll(
                        //           icon: Icon(Icons.more_horiz),
                        //           text: Text('data'),
                        //         ),
                        //         boxW,
                        //         CustomeScroll(
                        //           icon: Icon(Icons.more_horiz),
                        //           text: Text('data'),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        box,
                        Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const GoogleAdScreen()));
                                    },
                                    child: Text(
                                      'Our Docters',
                                      style: homep,
                                    ),
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

// bool _showFirstImage = true;
// late Timer _timer;
Greetings greetings = Greetings();

class CustomeScroll extends StatelessWidget {
  const CustomeScroll({
    super.key,
    required this.icon,
    required this.text,
  });
  final Icon icon;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 241, 237, 235),
        ),
        child: TextButton.icon(
          onPressed: () {},
          icon: icon,
          label: text,
        ));
  }
}
