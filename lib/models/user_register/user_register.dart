import 'package:json_annotation/json_annotation.dart';

part 'user_register.g.dart';

@JsonSerializable()
class UserRegister {
  String email, username, password, first_name, last_name;
  UserRegister(
      {required this.username,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.password});

  factory UserRegister.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
}
