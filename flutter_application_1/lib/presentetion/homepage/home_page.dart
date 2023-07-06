import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
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
            child: ListView(children: [
      Column(
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
                child: Text(
                  'Aswin',
                  style: homep,
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
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Search',
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.lightGreen,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
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
            padding: const EdgeInsets.only(left: 35),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'fever',
                        style: fonts,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Could',
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
                      color: Colors.grey,
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'More',
                          style: fonts,
                        )),
                  ),
                ),
              ],
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
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: homep,
                    )),
              ),
            ],
          ),
          const Divider(),
          const ListileCustome(name: 'Shinsha'),
          const Divider(),
          const ListileCustome(
            name: 'Dr.vishnu',
          ),
          const ListileCustome(
            name: 'Dr.Pranav',
          ),
          const ListileCustome(
            name: 'Dr.Ajay',
          ),
        ],
      ),
    ])));
  }
}
