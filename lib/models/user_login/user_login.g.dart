// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) {
  return UserLogin(
    UserName: json['UserName'].toString(),
    Password: json['Password'].toString(),
  );
}

Map<String, dynamic> _$UserLoginToJson(UserLogin instance) => <String, dynamic>{
      'UserName': instance.UserName,
      'Password': instance.Password,
    };
