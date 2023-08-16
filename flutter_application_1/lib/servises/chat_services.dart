import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/doctor/message.dart';



class ChatService {
  final CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection("chat");

  Future<void> sendTextMessage(
    String senderId,
    String receiverId,
    String message,
    String doctorNumber
  ) async {

   
    
    final senderChatCollectionReference =
        userCollectionReference.doc(senderId).collection("chats");
    final senderChatDocumentReference =
        senderChatCollectionReference.doc(receiverId);
    await senderChatDocumentReference.set(
      {
        'contactId': senderId,
        'timeSent': DateTime.now(),
      },
    );
    final senderMessagesReference =
        senderChatDocumentReference.collection('messages');
    final senderMessageDocumentReference = senderMessagesReference.doc();
    final senderMessageId = senderMessageDocumentReference.id;

    // final senderChatMessage = ChatMessage(
    //   messageId: senderMessageId,
    //   senderId: senderId,
    //   textMessage: message,
    //   time: Timestamp.now(),
    // );
    Map<String,dynamic>data={
       'messageId': senderMessageId,
      'senderId': senderId,
      'textMessage': message,
      'time': Timestamp.now(),
    };

    await FirebaseFirestore.instance.collection("chat").doc(doctorNumber).collection('messages').doc().set(data);

    // await senderMessageDocumentReference.set(senderChatMessage.toSnapshot());

    final CollectionReference doctorCollectionReference =
        FirebaseFirestore.instance.collection("doctorsprofile");

    final receiverChatCollectionReference =
        doctorCollectionReference.doc(receiverId).collection("chats");
    final receiverChatDocumentReference =
        receiverChatCollectionReference.doc(senderId);
    await receiverChatDocumentReference.set(
      {
        'contactId': receiverId, // Change 'senderId' to 'receiverId'
        'timeSent': DateTime.now(),
      },
    );
    final receiverMessagesReference =
        receiverChatDocumentReference.collection('messages');
    final receiverMessageDocumentReference = receiverMessagesReference.doc();
    final receiverMessageId = receiverMessageDocumentReference.id;

    final receiverChatMessage = ChatMessage(
      messageId: receiverMessageId,
      senderId: senderId,
      textMessage: message,
      time: Timestamp.now(),
    );

    await receiverMessageDocumentReference
        .set(receiverChatMessage.toSnapshot());
  }
}
