import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/controller/provider/userprofile_updating_provider/user_profile.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/chat/chat_page.dart';
import 'package:flutter_application_1/presentetion/doctore_side/home_screen/home_screen.dart';
import 'package:flutter_application_1/presentetion/search_page/search_screen.dart';
import 'package:provider/provider.dart';
import '../pyment_screen_rz/pyment.dart';
import '../widgets/listtile_costome.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                              'Hai!!',
                              style: homep,
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Consumer<UserProfileUpadtingprovider>(
                              builder: (context, value, child) => Text(
                                'kj',
                                style: homep,
                              ),
                            ),
                          )),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 20, 20),
                            child: Icon(
                              Icons.notification_important_sharp,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
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
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Card(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              // height: 150,
                              // width: 300,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'asset/young-handsome-physician-medical-robe-with-stethoscope.jpg'),
                                      fit: BoxFit.cover)),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Chatpage(),
                                            ));
                                      },
                                      icon: const Icon(
                                        Icons.local_hospital_outlined,
                                        color: Colors.white,
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
                                      onPressed: () {},
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
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.local_hospital_outlined,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          'General',
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
                          Padding(
                            padding: const EdgeInsets.only(left: 230),
                            child: TextButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const PymentScreen(),
                                  //     ));
                                },
                                child: Text(
                                  'See all',
                                  style: homep,
                                )),
                          ),
                        ],
                      ),
                      const Divider(),
                      const ListileCustome(),
                    ],
                  ),
                )),
      ),
      // bottomNavigationBar: BottomNavigationPage(),
    );
  }
}
