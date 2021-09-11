import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:podcast_app/main.dart' as app;

// flutter drive  --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      var getStartedButton = find.byKey(Key("getStarted"));
      await Future.delayed(Duration(seconds: 3));

      // Widget token = Text(
      //   "This is some discription about our app any thing about our app",
      //   key: Key("wellCome"),
      //   style: TextStyle(
      //     color: Colors.grey,
      //   ),
      // );
      // var text = find.byKey(Key("wellCome"));
      // expect(text, token);

      await tester.tap(getStartedButton);
      await tester.pumpAndSettle();

      var signUpOnLogin = find.byKey(Key("signupButton"));
      await Future.delayed(Duration(seconds: 3));
      await tester.tap(signUpOnLogin);
      await tester.pumpAndSettle();

      String username = "manmkoanmmljkhkl";
      String password = "Bini1234,,";

      // signup page test

      var emailFieldInSignUp = find.byKey(Key("emailSignUp"));
      var userNameFieldInSignUp = find.byKey(Key("userNameSignup"));
      var passwordFieldInSignUp = find.byKey(Key("passwordSignup"));
      var register = find.byKey(Key("register"));

      await tester.enterText(emailFieldInSignUp, "lop@gmail.com");
      await Future.delayed(Duration(seconds: 2));
      await tester.enterText(userNameFieldInSignUp, username);
      await Future.delayed(Duration(seconds: 1));

      await tester.enterText(passwordFieldInSignUp, password);
      await Future.delayed(Duration(seconds: 2));

      await tester.tap(register);
      await Future.delayed(Duration(seconds: 3));

      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));
      // var signinInSignUp = find.byKey(Key("signin"));
      await tester.pumpAndSettle();

      // await tester.tap(signinInSignUp);

      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));

      // // login test
      var emailField = find.byKey(Key("email_field"));
      var passwordField = find.byKey(Key("password_field"));
      var loginButton = find.byKey(Key("signinButton"));

      await tester.enterText(emailField, username);
      await Future.delayed(Duration(seconds: 1));

      await tester.enterText(passwordField, password);
      await Future.delayed(Duration(seconds: 2));

      await tester.tap(loginButton);
      await Future.delayed(Duration(seconds: 3));

      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 3));
    });
  });
}
