import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcast_app/application/signup/signup_bloc.dart';
import 'package:podcast_app/data_provider/sugnup/signup_provider.dart';
import 'package:podcast_app/presentation/pages/signup/widgets/signup_widget.dart';
import 'package:podcast_app/repository/signup%20repository/SignupRepository.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets("Testing the signin page has some widgets.",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupBloc(
              signupRepository: SignupRepository(
                  signupProvider: SignupProvider(httpClient: http.Client())),
            ),
          )
        ],
        child: MaterialApp(
          home: SignupWidget(),
        ),
      ),
    );

    expect(find.text("Getting started"), findsOneWidget);
    expect(find.text("Create an account to continue!"), findsOneWidget);
    expect(_getEmailField(), findsOneWidget);
    expect(_getPasswordField(), findsOneWidget);
    expect(_getGestureDetector(), findsNothing);
    expect(find.byType(TextFormField), findsNWidgets(3));
  });
}

Finder _getEmailField() {
  WidgetPredicate widgetPredicate = (Widget widget) =>
      widget is Text &&
      widget.data == "Email" &&
      widget.style == TextStyle(color: Colors.grey);
  return find.byWidgetPredicate(widgetPredicate);
}

Finder _getPasswordField() {
  WidgetPredicate widgetPredicate = (Widget widget) =>
      widget is Text &&
      widget.data == "Password" &&
      widget.style == TextStyle(color: Colors.grey);
  return find.byWidgetPredicate(widgetPredicate);
}

Finder _getGestureDetector() {
  WidgetPredicate widgetPredicate = (Widget widget) =>
      widget is GestureDetector &&
      widget.child ==
          Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.white,
          );
  return find.byWidgetPredicate(widgetPredicate);
}
