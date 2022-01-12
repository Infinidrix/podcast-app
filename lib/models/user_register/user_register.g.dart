// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) {
  return UserRegister(
    username: json['UserName'].toString(),
    email: json['Email'].toString(),
    first_name: json['FirstName'].toString(),
    last_name: json['LastName'].toString(),
    password: json['Password'].toString(),
  );
}

Map<String, dynamic> _$UserRegisterToJson(UserRegister instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };
