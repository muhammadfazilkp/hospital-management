import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:provider/provider.dart';
import '../../core/core.dart';
import '../slot_screens/view_slot.dart';

class ListileCustome extends StatelessWidget {



  const ListileCustome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminAddinProvider>(
      builder: (context, adp, child)
       => Expanded(
        child: ListView.builder(
            itemCount: adp.doctors.length,
            itemBuilder: (context, index) {
              final doctor = adp.doctors[index];

              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SloteCheckingScreen(doctor: doctor)));
                     
                  },
                  child: Card(
                    color: Colors.grey[200],
                    child: ListTile(
                      visualDensity: const VisualDensity(vertical: 3),
                      leading: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: CircleAvatar(
                          radius: 39,
                          backgroundImage: NetworkImage(adp.doctors[index].image),
                        ),
                      ),
                      title: Text(
                        adp.doctors[index].doctor,
                        style: homep,
                      ),
                      subtitle: Text(
                        adp.doctors[index].category,
                        style: fonts,
                      ),
                      trailing: Column(
                        // mainAxisSize: MainAxisSize.min,
                
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.currency_rupee_outlined,size: 17,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  adp.doctors[index].pyment,
                                  style: payment,
                                )),
                          ),
                          Flexible(
                            flex: 1,
                            child: TextButton.icon(
                                onPressed: () {
                                 
                                },
                                icon: Text(
                                  'check the slot',
                                  style: homep,
                                ),
                                label: const Icon(
                                  Icons.checklist_rtl_sharp,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
