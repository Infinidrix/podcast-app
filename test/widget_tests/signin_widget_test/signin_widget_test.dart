// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/home_page/home_page_state.dart';
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/data_provider/home_page_provider/Home_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/presentation/pages/signin/widgets/signin_page_widget.dart';
import 'package:podcast_app/repository/home_page_repository/HomePageRepository.dart';
import 'package:podcast_app/repository/login_repository.dart';

import '../../core_mocks/core_mocks.dart';
class MockSigninBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class SigninStateFake extends Fake implements LoginState {}

class SigninEventFake extends Fake implements LoginEvent {}

void main() {
  final homePageRepository =
      HomePageRepository(dataProvider: HomeProvider(httpClient: http.Client()));
  group("Signin widget testing", () {
    setUpAll(() {
      registerFallbackValue<LoginState>(SigninStateFake());
      registerFallbackValue<LoginEvent>(SigninEventFake());
      registerFallbackValue<HomePageEvent>(HomepageEventFake());
      registerFallbackValue<HomePageState>(HomepageStateFake());
    });

    testWidgets("Testing the button of signin.", (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockSigninBloc = MockSigninBloc();
        final mockHomepageBloc = MockHomepageBloc();

        when(() => mockSigninBloc.state).thenReturn(
          InitialLoginState(),
        );
        when(() => mockHomepageBloc.state).thenReturn(
          LoadedHomePageState(topPicks: [], trending: [], recentlyPlayed: []),
        );
        final widget = SigninWidget();

        await mockNetworkImagesFor(
          () async => await tester.pumpWidget(MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(
                create: (context) => mockSigninBloc,
              ),
              BlocProvider<HomePageBloc>(create: (context) => mockHomepageBloc)
            ],
            child: MaterialApp(
              home: widget,
            ),
          )),
        );

        var button = find.text("Sign In");
        expect(button, findsOneWidget);
      });
    });

    testWidgets("Testing the TextFormField.", (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockSigninBloc = MockSigninBloc();
        final mockHomepageBloc = MockHomepageBloc();

        when(() => mockSigninBloc.state).thenReturn(
          InitialLoginState(),
        );
        when(() => mockHomepageBloc.state).thenReturn(
          LoadedHomePageState(topPicks: [], trending: [], recentlyPlayed: []),
        );
        final widget = SigninWidget();

        await mockNetworkImagesFor(
          () async => await tester.pumpWidget(MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(
                create: (context) => mockSigninBloc,
              ),
              BlocProvider<HomePageBloc>(create: (context) => mockHomepageBloc)
            ],
            child: MaterialApp(
              home: widget,
            ),
          )),
        );

        var emailfield = find.byKey(Key("email_field"));
        expect(emailfield, findsOneWidget);
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
    });
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
