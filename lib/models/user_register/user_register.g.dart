// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) {
  return UserRegister(
    UserName: json['UserName'].toString(),
    Email: json['Email'].toString(),
    FirstName: json['FirstName'].toString(),
    LastName: json['LastName'].toString(),
    Password: json['Password'].toString(),
    ProfilePicture: json['ProfilePicture'].toString(),
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
