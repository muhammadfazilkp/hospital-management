import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';

class AppoimentPage extends StatefulWidget {
  const AppoimentPage({Key? key}) : super(key: key);

  @override
  State<AppoimentPage> createState() => _AppoimentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppoimentPageState extends State<AppoimentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<Map<String, dynamic>> shedules = [
    {
      'doctore_name': 'sweetha',
      'category': 'skinspecialist',
      'status': 'completed',
    }
  ];

  List<Map<String, dynamic>> getFilteredSchedules() {
    return shedules.where((schedule) {
      switch (schedule['status']) {
        case 'upcoming':
          return status == FilterStatus.upcoming;
        case 'complete':
          return status == FilterStatus.complete;
        case 'cancel':
          return status == FilterStatus.cancel;
        default:
          return false;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredSchedules = getFilteredSchedules();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filtered Schedules',
          style: homep,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Appoiment Shedule ',
              style: homep,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                style: homep,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      status.name,
                      style: homep,
                    ),
                  ),
                )
              ],
            ),
            box,
            Expanded(
                child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: (context, index) {
                var _filteredSchedules = filteredSchedules[index];

                bool isLastElament = filteredSchedules.length + 1 == [index];
                return Card(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: !isLastElament
                      ? const EdgeInsets.only(bottom: 20)
                      : EdgeInsets.zero,
                  child: const Padding(
                    padding: EdgeInsets.all(115),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'asset/doctor-is-going-examine-his-patient-using-his-stethoscope-sitting-people_1150-6561.avif'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //  Text(shedules['doctore_name'] as String)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
