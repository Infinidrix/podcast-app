import 'package:flutter/cupertino.dart';
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
      await tester.tap(getStartedButton);
      await tester.pumpAndSettle();

      var signUpOnLogin = find.byKey(Key("signupButton"));
      await Future.delayed(Duration(seconds: 3));
      await tester.tap(signUpOnLogin);
      await tester.pumpAndSettle();

      // signup page test

      var emailFieldInSignUp = find.byKey(Key("emailSignUp"));
      var userNameFieldInSignUp = find.byKey(Key("userNameSignup"));
      var passwordFieldInSignUp = find.byKey(Key("passwordSignup"));
      var register = find.byKey(Key("register"));

      await tester.enterText(emailFieldInSignUp, "lop@gmail.com");
      await Future.delayed(Duration(seconds: 2));
      await tester.enterText(userNameFieldInSignUp, "lopp");
      await Future.delayed(Duration(seconds: 1));

      await tester.enterText(passwordFieldInSignUp, "Bini1234,,");
      await Future.delayed(Duration(seconds: 2));

      await tester.tap(register);
      await Future.delayed(Duration(seconds: 3));

      await tester.pumpAndSettle();

      String username = "lopp";
      String password = "Bini1234,,";
      // // login test
      // var email_field = find.byKey(Key("email_field"));
      // var password_field = find.byKey(Key("password_field"));
      // var loginButton = find.byKey(Key("loginButton"));

      // await tester.enterText(emailFieldInSignUp, "lop@gmail.com");
      // await Future.delayed(Duration(seconds: 2));
      // await tester.enterText(userNameFieldInSignUp, username);
      // await Future.delayed(Duration(seconds: 1));

      // await tester.enterText(emailFieldInSignUp, password);
      // await Future.delayed(Duration(seconds: 2));

      // await tester.tap(register);
      // await Future.delayed(Duration(seconds: 3));
    });
  });
}
