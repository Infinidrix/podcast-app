import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_application.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:podcast_app/presentation/pages/create_podcast/widgets/create_podcast_widget.dart';

class MockCreatePodcastBloc
    extends MockBloc<CreatePodcastEvent, CreatePodcastState>
    implements CreatePodcastBloc {}

class CreatePodcastStateFake extends Fake implements CreatePodcastState {}

class CreatePodcastEventFake extends Fake implements CreatePodcastEvent {}

void main() {
  group("Create Podcast", () {
    setUpAll(() {
      registerFallbackValue<CreatePodcastState>(CreatePodcastStateFake());
      registerFallbackValue<CreatePodcastEvent>(CreatePodcastEventFake());
    });

    testWidgets("Checking if the form exists", (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockCreatePodcastBloc = MockCreatePodcastBloc();
        when(() => mockCreatePodcastBloc.state).thenReturn(
          CreatePodcastInitialState(),
        );
        final widget = CreatePodcastWidget(
          channelId: "h",
        );

        await mockNetworkImagesFor(
          () async => await tester.pumpWidget(
            BlocProvider<CreatePodcastBloc>(
              create: (context) => mockCreatePodcastBloc,
              child: MaterialApp(
                home: widget,
              ),
            ),
          ),
        );

        var formFinder = find.byType(Form);
        expect(formFinder, findsOneWidget);
      });
    });

    testWidgets("CreateChannelWidget contains some widgets",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockCreatePodcastBloc = MockCreatePodcastBloc();
        when(() => mockCreatePodcastBloc.state).thenReturn(
          CreatePodcastInitialState(),
        );
        final widget = CreatePodcastWidget(
          channelId: "h",
        );

        await mockNetworkImagesFor(
          () async => await tester.pumpWidget(
            BlocProvider<CreatePodcastBloc>(
              create: (context) => mockCreatePodcastBloc,
              child: MaterialApp(
                home: widget,
              ),
            ),
          ),
        );

        var textFinder = find.text("Description");
        var iconButtons = find.byType(IconButton);
        var button = find.byType(ElevatedButton);
        WidgetPredicate widgetSelectedPredicate = (Widget widget) =>
            widget is DecoratedBox &&
            widget.decoration ==
                BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [HexColor("#579EB5"), HexColor("#8EB9C7")]),
                  borderRadius: BorderRadius.circular(20.0),
                );

        expect(textFinder, findsOneWidget);
        expect(iconButtons, findsNWidgets(1));
        expect(button, findsOneWidget);
        expect(find.byType(ListView), findsNWidgets(1));
        expect(find.byWidgetPredicate(widgetSelectedPredicate), findsOneWidget);
      });
    });
  });
}
