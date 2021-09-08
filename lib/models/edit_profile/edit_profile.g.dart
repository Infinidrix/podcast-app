// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEditProfile _$UserEditProfileFromJson(Map<String, dynamic> json) {
  return UserEditProfile(
    ProfilePicture: json['ProfilePicture'] as String,
    UserName: json['UserName'] as String,
    Email: json['Email'] as String,
    Password: json['Password'] as String,
    FirsName: json['FirsName'] as String,
    LastName: json['LastName'] as String,
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
