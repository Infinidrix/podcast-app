import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_application.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_bloc.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_event.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_state.dart';
import 'package:podcast_app/presentation/pages/create_podcast/widgets/create_podcast_widget.dart';

class MockCreatePodcastBloc
    extends MockBloc<CreatePodcastEvent, CreatePodcastState>
    implements CreatePodcastBloc {}

class CreatePodcastStateFake extends Fake implements CreatePodcastState {}

class CreatePodcastEventFake extends Fake implements CreatePodcastEvent {}

class MockEditChannel extends MockBloc<EditChannelEvent, EditChannelState>
    implements EditChannelBloc {}

class EditChannelStateFake extends Fake implements EditChannelState {}

class EditChannelEventFake extends Fake implements EditChannelEvent {}

void main() {
  group("Create Podcast", () {
    setUpAll(() {
      registerFallbackValue<CreatePodcastState>(CreatePodcastStateFake());
      registerFallbackValue<CreatePodcastEvent>(CreatePodcastEventFake());
      registerFallbackValue<EditChannelState>(EditChannelStateFake());
      registerFallbackValue<EditChannelEvent>(EditChannelEventFake());
    });

    testWidgets("Checking if the form exists", (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockCreatePodcastBloc = MockCreatePodcastBloc();
        when(() => mockCreatePodcastBloc.state).thenReturn(
          CreatePodcastInitialState(),
        );
        final mockEditChannelBloc = MockEditChannel();
        when(() => mockEditChannelBloc.state).thenReturn(
          LoadingEditChannelState(),
        );
        final widget = CreatePodcastWidget(
          channelId: "h",
        );

        await mockNetworkImagesFor(
          () async => await tester.pumpWidget(
            MultiBlocProvider(
              providers: [
                BlocProvider<CreatePodcastBloc>(
                    create: (context) => mockCreatePodcastBloc),
                BlocProvider<EditChannelBloc>(
                    create: (context) => mockEditChannelBloc),
              ],
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
        final mockEditChannelBloc = MockEditChannel();
        when(() => mockEditChannelBloc.state).thenReturn(
          LoadingEditChannelState(),
        );
        final widget = CreatePodcastWidget(
          channelId: "h",
        );

        await mockNetworkImagesFor(
          () async => await tester.pumpWidget(
            MultiBlocProvider(
              providers: [
                BlocProvider<CreatePodcastBloc>(
                    create: (context) => mockCreatePodcastBloc),
                BlocProvider<EditChannelBloc>(
                    create: (context) => mockEditChannelBloc),
              ],
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
