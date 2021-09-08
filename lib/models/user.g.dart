// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    FullName: json['FullName'].toString(),
    Email: json['Email'].toString(),
    UserName: json['UserName'].toString(),
    ProfilePicturePath: json['ProfilePicturePath'].toString(),
    Id: json['Id'].toString(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'FullName': instance.FullName,
      'Email': instance.Email,
      'UserName': instance.UserName,
      'ProfilePicturePath': instance.ProfilePicturePath,
      'Id': instance.Id,
    };
