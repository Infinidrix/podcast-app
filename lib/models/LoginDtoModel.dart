import 'package:json_annotation/json_annotation.dart';
import 'package:podcast_app/models/user.dart';

part 'LoginDtoModel.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginDtoModel {
  String Token;
  String expiration;
  User user;
  LoginDtoModel(
      {required this.Token, required this.user, required this.expiration});
  factory LoginDtoModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoModelToJson(this);
}
