// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginDtoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDtoModel _$LoginDtoModelFromJson(Map<String, dynamic> json) {
  return LoginDtoModel(
    Token: json['Token'].toString(),
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    expiration: json['expiration'].toString(),
  );
}

Map<String, dynamic> _$LoginDtoModelToJson(LoginDtoModel instance) =>
    <String, dynamic>{
      'Token': instance.Token,
      'expiration': instance.expiration,
      'user': instance.user.toJson(),
    };
