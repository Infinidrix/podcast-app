String? isPasswordValid(String password, [int minLength = 8]) {
  if (password == null || password.length < minLength) {
    return "Password length should be 8 and above";
  }

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  if (hasUppercase) {
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    if (hasDigits) {
      bool hasLowercase = password.contains(RegExp(r'[a-z]'));
      if (hasLowercase) {
        bool hasSpecialCharacters =
            password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
        // return hasSpecialCharacters;
        if (hasSpecialCharacters) {
          return null;
        } else {
          return "Password should contain Special Characters";
        }
      } else {
        return "Password should contain lowercase letters";
      }
    } else {
      return "Password Should have digits";
    }
  }
  return "Password should contain upercase letters";
}
