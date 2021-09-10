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
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/data_provider/home_page_provider/Home_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/presentation/pages/signin/widgets/signin_page_widget.dart';
import 'package:podcast_app/repository/home_page_repository/HomePageRepository.dart';
import 'package:podcast_app/repository/login_repository.dart';

void main() {
  final homePageRepository =
      HomePageRepository(dataProvider: HomeProvider(httpClient: http.Client()));
  testWidgets("Testing the button of signin.", (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(
                loginRepository: LoginRepository(
              loginDataProvider: LoginProvider(
                httpClient: http.Client(),
              ),
            )),
          ),
          BlocProvider(
              create: (context) =>
                  HomePageBloc(repository: homePageRepository)),
        ],
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
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(
                loginRepository: LoginRepository(
              loginDataProvider: LoginProvider(
                httpClient: http.Client(),
              ),
            )),
          ),
          BlocProvider(
              create: (context) =>
                  HomePageBloc(repository: homePageRepository)),
        ],
        child: MaterialApp(
          home: SigninWidget(),
        ),
      ),
    );
    var emailfield = find.byKey(Key("email_field"));

    expect(emailfield, findsOneWidget);
  });

  testWidgets("Testing the signin page has some widgets.",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(
                loginRepository: LoginRepository(
              loginDataProvider: LoginProvider(
                httpClient: http.Client(),
              ),
            )),
          ),
          BlocProvider(
              create: (context) =>
                  HomePageBloc(repository: homePageRepository)),
        ],
        child: MaterialApp(
          home: SigninWidget(),
        ),
      ),
    );
    var noOfContainer = find.byType(Container);
    WidgetPredicate widgetSelectedPredicate = (Widget widget) =>
        widget is GestureDetector &&
        widget.child ==
            Icon(
              Icons.remove_red_eye_outlined,
            );
    expect(noOfContainer, findsNWidgets(2));
    expect(find.byWidgetPredicate(widgetSelectedPredicate), findsNothing);
    expect(_getPasswordTextFormField(), findsOneWidget);
    expect(_getElevatedButton(), findsNothing);
  });
}

Finder _getPasswordTextFormField() {
  WidgetPredicate widgetSelectedPredicate = (Widget widget) =>
      widget is TextFormField && widget.key == Key("password_field");

  return find.byWidgetPredicate(widgetSelectedPredicate);
}

Finder _getElevatedButton() {
  WidgetPredicate widgetSelectedPredicate = (Widget widget) =>
      widget is ElevatedButton &&
      widget.style ==
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          );

  return find.byWidgetPredicate(widgetSelectedPredicate);
}
