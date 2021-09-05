// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    FullName: json['FullName'] as String,
    Email: json['Email'] as String,
    UserName: json['UserName'] as String,
    ProfilePicturePath: json['ProfilePicturePath'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'FullName': instance.FullName,
      'Email': instance.Email,
      'UserName': instance.UserName,
      'ProfilePicturePath': instance.ProfilePicturePath,
    };
