// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/application/sign_in/sign_in_bloc.dart';
import 'package:podcast_app/application/signup/signup_bloc.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';

import 'package:podcast_app/main.dart';
import 'package:podcast_app/presentation/app_widget.dart';
import 'package:podcast_app/presentation/pages/signin/widgets/signin_page_widget.dart';
import 'package:podcast_app/repository/login_repository.dart';

void main() {
  testWidgets("Testing the button of signin.", (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => LoginBloc(
            loginRepository: LoginRepository(
          loginDataProvider: LoginProvider(
            httpClient: http.Client(),
          ),
        )),
        child: MaterialApp(
          home: SigninWidget(),
        ),
      ),
    );
    var button = find.text("Sign In");
    expect(button, findsOneWidget);
  });
  testWidgets("Testing the TextFormField.", (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => LoginBloc(
            loginRepository: LoginRepository(
          loginDataProvider: LoginProvider(
            httpClient: http.Client(),
          ),
        )),
        child: MaterialApp(
          home: SigninWidget(),
        ),
      ),
    );
    var emailfield = find.byKey(Key("email_field"));

    expect(emailfield, findsOneWidget);
  });
}
