import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String FullName;
  String Email;
  String UserName;
  String ProfilePicturePath;
  User(
      {required this.FullName,
      required this.Email,
      required this.UserName,
      required this.ProfilePicturePath});
  // factory User.fromJson(Map<String, dynamic> json) {
  //   final user = User(
  //       FullName: "${json['firstName']} ${json['lastName']}",
  //       Email: json['email'],
  //       UserName: json['userName'],
  //       ProfilePicturePath: json['profilePicture']);
  //   return user;
  // }
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
