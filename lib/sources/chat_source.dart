import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject_mototbike/models/chat.dart';

class ChatSource {
  static Future<void> openChatRoom(String uid, String userName) async {
    final doc =
        await FirebaseFirestore.instance.collection('Cs').doc(uid).get();
    if (doc.exists) {
      await FirebaseFirestore.instance.collection('Cs').doc(uid).update({
        'newFromCs': false,
      });
      return;
    }
    //first time caht room
    await FirebaseFirestore.instance.collection('Cs').doc(uid).set({
      'rooomId': uid,
      'name': userName,
      'lastmassage': 'Welcome to Motobike',
      'newFromUser': false,
      'newFromCs': true,
    });
    // Chat firstChat = Chat(
    //   roomId: uid,
    //   massage: 'Welcome to Motobike',
    //   receiverId: uid,
    //   sanderId: 'Cs',
    //   bikeDetail: null,
    // );
    await FirebaseFirestore.instance
        .collection('Cs')
        .doc(uid)
        .collection('chats')
        .add({
      'roomId': uid,
      'massage': 'Welcome to Motobike',
      'receiverId': uid,
      'sanderId': 'Cs',
      'bikeDetail': null,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  static Future<void> send(Chat chat, String uid) async {
    await FirebaseFirestore.instance.collection('Cs').doc(uid).update({
      'lastmassage': chat.massage,
      'newFromUser': true,
      'newFromCs': false,
    });
    await FirebaseFirestore.instance
        .collection('Cs')
        .doc(uid)
        .collection('Chats')
        .add({
      'roomId': chat.roomId,
      'massage': chat.massage,
      'receiverId': chat.receiverId,
      'sanderId': chat.sanderId,
      'bikeDetail': chat.bikeDetail,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
