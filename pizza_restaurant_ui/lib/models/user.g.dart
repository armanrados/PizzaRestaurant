// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['userID'] as int?,
      json['name'] as String?,
      json['lastName'] as String?,
      json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      json['email'] as String?,
      json['username'] as String?,
      json['roleID'] as int?,
      json['password'] as String?,
      json['roleNames'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'name': instance.name,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'roleID': instance.roleID,
      'roleNames': instance.roleNames,
    };
