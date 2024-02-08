
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/message/widgets/messege_list.dart';



class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const  Text('Message Screen')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Text(
                'Messages',
                style: homep,
              ),
              // kHeight15,
               const MessageListDoctors(),
            ],
          ),
        ),
      ),
    );
  }
}
