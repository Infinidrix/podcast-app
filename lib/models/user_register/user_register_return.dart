import 'package:podcast_app/models/user_login/user_login.dart';
import 'package:podcast_app/models/user_register/user_register.dart';

class UserRegisterReturn {
  final UserLogin UserCred;
  final UserRegister User;

  UserRegisterReturn({required this.UserCred, required this.User});
}
