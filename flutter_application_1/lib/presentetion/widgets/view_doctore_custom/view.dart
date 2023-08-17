import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../../model/doctor/doctor.dart';

class Vewdoctors extends StatelessWidget {
  const Vewdoctors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminAddinProvider>(
      builder: (context, viewProvider, child) => Expanded(
        child: ListView.builder(
          itemCount: viewProvider.doctors.length,
          itemBuilder: (context, index) {
            final doctor = viewProvider.doctors[index];
            return Card(
              color: Colors.grey[200],
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(doctor.image),
                ),
                title: Text(
                  doctor.doctor,
                  style: homep,
                ),
                subtitle: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(
                        doctor.category,
                        style: homep,
                      ),
                      Text(
                        doctor.experience,
                        style: homep,
                      ),
                      Text(
                        doctor.phonenumber,
                        style: homep,
                      ),
                      Text(
                        doctor.place,
                        style: homep,
                      ),
                      Text(
                        doctor.pyment,
                        style: homep,
                      ),
                    ],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, doctor);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, doctor);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, Doctor doctor) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this doctor?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the delete method from the provider
                Provider.of<AdminAddinProvider>(context, listen: false)
                    .deleteDoctor(doctor.phonenumber);
                // Assuming you have a docId property in Doctor class
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
