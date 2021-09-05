import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile.g.dart';

@JsonSerializable()
class UserEditProfile extends Equatable {
  String Email, UserName, Password, ProfilePicture, FirsName, LastName;
  UserEditProfile(
      {required this.ProfilePicture,
      required this.UserName,
      required this.Email,
      required this.Password,
      required this.FirsName,
      required this.LastName});

  factory UserEditProfile.fromJson(Map<String, dynamic> json) =>
      _$UserEditProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserEditProfileToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [UserName, Email, Password, FirsName, LastName, ProfilePicture];
}
