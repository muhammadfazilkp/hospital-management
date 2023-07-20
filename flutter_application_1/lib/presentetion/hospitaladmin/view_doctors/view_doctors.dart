import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:provider/provider.dart';

import '../../widgets/view_doctore_custom/view.dart';

class ViewDoctorsScreen extends StatelessWidget {
  const ViewDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'DOCTORS LIST ',
          style: homep,
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Consumer<AdminAddinProvider>(
            builder: (context, value, child) => FutureBuilder(
                  future: value.getAllDoctors(),
                  builder: (context, snapshot) => const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      box,
                      Vewdoctors(),
                    ],
                  ),
                )),
      ),
    );
  }
}
