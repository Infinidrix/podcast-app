import 'package:equatable/equatable.dart';

class UserEditProfile extends Equatable {
  bool isCreator;
  String Email, UserName, Password, ProfilePicture, FirsName, LastName;
  UserEditProfile(
      {required this.ProfilePicture,
      required this.UserName,
      required this.Email,
      required this.Password,
      required this.FirsName,
      required this.LastName,
      required this.isCreator});

  factory UserEditProfile.fromJson(Map<String, dynamic> json) {
    return UserEditProfile(
      ProfilePicture: json['ProfilePicture'],
      UserName: json['UserName'],
      Email: json['Email'],
      Password: json['Password'],
      FirsName: json['FirsName'],
      LastName: json['LastName'],
      isCreator: json['isCreator'].toString().toLowerCase() == 'true',
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props =>
      [UserName, Email, Password, FirsName, LastName, ProfilePicture];
  Map<String, dynamic> toJson() => {
        'isCreator': isCreator,
        'Email': Email,
        'UserName': UserName,
        'Password': Password,
        'ProfilePicture': ProfilePicture,
        'FirsName': FirsName,
        'LastName': LastName,
      };
}
