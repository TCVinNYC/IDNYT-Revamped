import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String name;
  final String email;
  final String message;
  final String profilePicture;
  final Timestamp time;

  MessageModel({
    required this.name,
    required this.email,
    required this.message,
    required this.profilePicture,
    required this.time,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      message: json['message'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      time: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['message'] = message;
    data['time'] = time;
    data['profilePicture'] = profilePicture;
    return data;
  }
}
