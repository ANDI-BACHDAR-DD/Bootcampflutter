import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String roomId;
  final String massage;
  final String receiverId;
  final String sanderId;
  final Map? bikeDetail;
  final Timestamp? timestamp;
  Chat({
    required this.roomId,
    required this.massage,
    required this.receiverId,
    required this.sanderId,
    this.bikeDetail,
    this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'roomId': roomId,
      'massage': massage,
      'receiverId': receiverId,
      'sanderId': sanderId,
      'bikeDetail': bikeDetail,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      roomId: json['roomId'] as String,
      massage: json['massage'] as String,
      receiverId: json['receiverId'] as String,
      sanderId: json['sanderId'] as String,
      bikeDetail: json['bikeDetail'] != null
          ? Map.from(json['bikeDetail'] as Map<String, dynamic>)
          : null,
      timestamp: json['timestamp'],
    );
  }
}
