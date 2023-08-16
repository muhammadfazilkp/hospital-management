import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/provider/admin_side/admin_adding_side.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/presentetion/hospitaladmin/message/widgets/textform_messege_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../model/doctor/doctor_chat_model.dart';
import '../../../servises/chat_services.dart';

class DoctorSideChattingScreen extends StatelessWidget {
  final chatController = TextEditingController();

  final String name;
  final String userid;

  DoctorSideChattingScreen({
    super.key,
    required this.name,
    required this.userid,
  });

  @override
  Widget build(BuildContext context) {
    var currentuserid = FirebaseAuth.instance.currentUser!.uid;

    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Text(
            name,
            style: homep,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    // .collection('userprofile')
                    // .doc(currentuserid)
                    .collection('chat')
                    .doc(Provider.of<AdminAddinProvider>(context, listen: false)
                        .doctor!
                        .phonenumber)
                    .collection('messages')
                    .orderBy('time', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs
                        .map((doc) => ChatMessage.fromSnapshot(doc))
                        .toList();

                    final groupedMessages = groupBy(
                      messages,
                      (message) => DateFormat("dd MMM yyyy")
                          .format(message.time.toDate()),
                    );

                    return ListView.builder(
                      reverse: true,
                      itemCount: groupedMessages.length,
                      itemBuilder: (context, index) {
                        final date = groupedMessages.keys.elementAt(index);
                        final messagesForDate =
                            groupedMessages.values.elementAt(index);
                        final dateCard = Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              date,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                // color: Colors.white
                              ),
                            ),
                          ),
                        );
                        return Column(
                          children: [
                            dateCard,
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: messagesForDate.length,
                              itemBuilder: (context, index) {
                                final message = messagesForDate[index];
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 8,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        message.senderId == currentuserid
                                            ? MainAxisAlignment.end
                                            : MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 14,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(20),
                                            topRight: const Radius.circular(20),
                                            bottomRight: Radius.circular(
                                                message.senderId ==
                                                        FirebaseAuth.instance
                                                            .currentUser!.uid
                                                    ? 0
                                                    : 20),
                                            topLeft: Radius.circular(
                                                message.senderId ==
                                                        FirebaseAuth.instance
                                                            .currentUser!.uid
                                                    ? 20
                                                    : 0),
                                          ),
                                          color:
                                              message.senderId == currentuserid
                                                  ? Colors.grey.shade800
                                                  : const Color.fromARGB(
                                                          255, 78, 77, 77)
                                                      .withOpacity(0.6),
                                        ),
                                        constraints:
                                            BoxConstraints(maxWidth: w * 2 / 3),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 30),
                                              child: Text(
                                                message.textMessage,
                                                style: GoogleFonts.outfit(
                                                  color: Colors.yellow,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Container(
                                              constraints: const BoxConstraints(
                                                  maxWidth:
                                                      60), // Set the maximum width
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    DateFormat.jm()
                                                        .format(message.time
                                                            .toDate())
                                                        .toString(),
                                                    style: GoogleFonts.lato(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                  if (message.senderId ==
                                                      currentuserid)
                                                    const Icon(
                                                      Icons.done,
                                                      color: Colors.red,
                                                      size: 15,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  //?enter a message widget-----------------------------------
                  TextFormMesasge(chatController: chatController),
                  IconButton(
                    onPressed: () {
                      if (chatController.text.trim().isNotEmpty) {
                        ChatService().sendTextMessage(
                            currentuserid,
                            userid,
                            chatController.text.trim(),
                            Provider.of<AdminAddinProvider>(context,
                                    listen: false)
                                .doctor!
                                .phonenumber);
                        chatController.clear();
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
