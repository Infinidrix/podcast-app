import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/home_page/home_page_state.dart';
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/application/signup/signup_bloc.dart';
import 'package:podcast_app/data_provider/sugnup/signup_provider.dart';
import 'package:podcast_app/presentation/pages/signup/widgets/signup_widget.dart';
import 'package:podcast_app/repository/signup%20repository/SignupRepository.dart';
import 'package:http/http.dart' as http;

import '../../core_mocks/core_mocks.dart';

class MockSignUpBloc extends MockBloc<SignupEvent, SignupState>
    implements SignupBloc {}

class SignUpStateFake extends Fake implements SignupState {}

class SignUpEventFake extends Fake implements SignupEvent {}

void main() {
  group("Signin widget testing", () {
    setUpAll(() {
      registerFallbackValue<SignupState>(SignUpStateFake());
      registerFallbackValue<SignupEvent>(SignUpEventFake());
      registerFallbackValue<HomePageEvent>(HomepageEventFake());
      registerFallbackValue<HomePageState>(HomepageStateFake());
    });

    testWidgets("Testing the button of signin.", (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockSignUpBloc = MockSignUpBloc();
        final mockHomepageBloc = MockHomepageBloc();

        when(() => mockSignUpBloc.state).thenReturn(
          InitialSignupState(),
        );
        when(() => mockHomepageBloc.state).thenReturn(
          LoadedHomePageState(topPicks: [], trending: [], recentlyPlayed: []),
        );
        final widget = SignupWidget();

        await mockNetworkImagesFor(
          () async => await tester.pumpWidget(MultiBlocProvider(
            providers: [
              BlocProvider<SignupBloc>(
                create: (context) => mockSignUpBloc,
              ),
              BlocProvider<HomePageBloc>(create: (context) => mockHomepageBloc)
            ],
            child: MaterialApp(
              home: widget,
            ),
          )),
        );

        expect(find.text("Getting started"), findsOneWidget);
        expect(find.text("Create an account to continue!"), findsOneWidget);
        expect(_getEmailField(), findsOneWidget);
        expect(_getPasswordField(), findsOneWidget);
        expect(_getGestureDetector(), findsNothing);
        expect(find.byType(TextFormField), findsNWidgets(3));
      });
    });
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
