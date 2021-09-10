import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_application.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_bloc.dart';
import 'package:podcast_app/presentation/pages/create_podcast/widgets/create_podcast_widget.dart';
import 'package:podcast_app/repository/CreatePodcastRepository.dart';

void main() {
  testWidgets('CreateChannelWidget contains Form', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => CreatePodcastBloc(
            CreatePodcastInitialState(), CreatePodcastRepository()),
        child: MaterialApp(
          home: CreatePodcastWidget(),
        ),
      ),
    );

    // Create the Finders.
    var formFinder = find.byType(Form);

    // Use the `findsOneWidget` matcher provided by flutter_test to
    expect(formFinder, findsOneWidget);
    // expect(messageFinder, findsOneWidget);
  });
}
