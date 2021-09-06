// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEditProfile _$UserEditProfileFromJson(Map<String, dynamic> json) {
  return UserEditProfile(
    ProfilePicture: json['ProfilePicture'] as String,
    UserName: json['UserName'].toString(),
    Email: json['Email'].toString(),
    Password: json['Password'].toString(),
    FirsName: json['FirsName'].toString(),
    LastName: json['LastName'].toString(),
  );
}

Map<String, dynamic> _$UserEditProfileToJson(UserEditProfile instance) =>
    <String, dynamic>{
      'Email': instance.Email,
      'UserName': instance.UserName,
      'Password': instance.Password,
      'ProfilePicture': instance.ProfilePicture,
      'FirsName': instance.FirsName,
      'LastName': instance.LastName,
    };
