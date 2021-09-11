import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:podcast_app/application/create_channel/create_channel_bloc.dart';
import 'package:podcast_app/application/create_channel/create_channel_event.dart';
import 'package:podcast_app/application/create_channel/create_channel_state.dart';
import 'package:podcast_app/data_provider/channel_provider.dart';
import 'package:podcast_app/presentation/pages/create_channel/widgets/create_channel_widget.dart';
import 'package:podcast_app/repository/ChannelRepository.dart';
import 'package:http/http.dart' as http;

class MockCreateChannelBloc
    extends MockBloc<CreateChannelEvent, CreateChannelState>
    implements CreateChannelBloc {}

class CreateChannelStateFake extends Fake implements CreateChannelState {}

class CreateChannelEventFake extends Fake implements CreateChannelEvent {}

void main() {
  group("Create Channel", () {
    setUpAll(() {
      registerFallbackValue<CreateChannelState>(CreateChannelStateFake());
      registerFallbackValue<CreateChannelEvent>(CreateChannelEventFake());
    });
    testWidgets("Testing the signin page has some widgets.",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockCreatePodcastBloc = MockCreateChannelBloc();
        when(() => mockCreatePodcastBloc.state).thenReturn(
          CreateChannelInitialState(),
        );
        final widget = CreateChannelWidget();

        await mockNetworkImagesFor(
          () async => await tester.pumpWidget(
            BlocProvider<CreateChannelBloc>(
              create: (context) => mockCreatePodcastBloc,
              child: MaterialApp(
                home: widget,
              ),
            ),
          ),
        );

        expect(find.text("Create Channel"), findsOneWidget);
        expect(find.text("Channel Name"), findsOneWidget);
        expect(_getNameField(), findsOneWidget);
      });
    });
  });
}

Finder _getNameField() {
  WidgetPredicate widgetPredicate = (Widget widget) =>
      widget is Text &&
      widget.data == "Channel Name" &&
      widget.style == TextStyle(color: Colors.grey);

  return find.byWidgetPredicate(widgetPredicate);
}
