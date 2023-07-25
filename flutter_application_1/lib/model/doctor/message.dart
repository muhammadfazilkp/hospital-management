import 'package:cloud_firestore/cloud_firestore.dart';

class Message{

  String? messageId;
 String? senderId;
   String? textMessage;
 Timestamp? time;


Message({this.messageId,this.senderId,this.textMessage,this.time});

    factory Message.fromSnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Message(
      messageId: data['messageId'],
      senderId: data['senderId'],
      textMessage: data['textMessage'],
      time: data['time'],
    );
  }

  Map<String, dynamic> toSnapshot() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'textMessage': textMessage,
      'time': time,
    };
  }

}