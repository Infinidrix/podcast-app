import 'package:json_annotation/json_annotation.dart';

part 'user_register.g.dart';

@JsonSerializable()
class UserRegister {
  String Email, UserName, Password, FirstName, LastName, ProfilePicture;
  UserRegister(
      {required this.UserName,
      required this.Email,
      required this.FirstName,
  required this.LastName,
      required this.Password,
      required this.ProfilePicture});
  factory UserRegister.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
}
