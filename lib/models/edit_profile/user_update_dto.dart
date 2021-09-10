class UserUpdate {
  String Email, UserName, Password;
  UserUpdate(
      {required this.Email, required this.Password, required this.UserName});

  factory UserUpdate.fromJson(Map<String, dynamic> json) {
    return UserUpdate(
        Email: json['email'],
        Password: json['password'],
        UserName: json['userName']);
  }
  Map<String, dynamic> tojson() =>
      {'email': Email, 'password': Password, 'userName': UserName};
}
