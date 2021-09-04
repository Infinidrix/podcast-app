// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) {
  return UserRegister(
    UserName: json['UserName'] as String,
    Email: json['Email'] as String,
    FirstName: json['FirstName'] as String,
    LastName: json['LastName'] as String,
    Password: json['Password'] as String,
    ProfilePicture: json['ProfilePicture'] as String,
  );
}

Map<String, dynamic> _$UserRegisterToJson(UserRegister instance) =>
    <String, dynamic>{
      'Email': instance.Email,
      'UserName': instance.UserName,
      'Password': instance.Password,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'ProfilePicture': instance.ProfilePicture,
    };
