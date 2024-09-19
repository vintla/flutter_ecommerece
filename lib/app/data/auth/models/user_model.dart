import 'dart:convert';

import 'package:ecommerce_app/app/domain/auth/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String profilePhoto;
  final int gender;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profilePhoto,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profilePhoto': profilePhoto,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      profilePhoto: map['profilePicture'] ?? '',
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      profilePhoto: profilePhoto,
      gender: gender,
    );
  }
}
