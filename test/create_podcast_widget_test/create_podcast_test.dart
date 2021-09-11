import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_application.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_bloc.dart';
import 'package:podcast_app/data_provider/create_podcast_provider/create_podcast_provider.dart';
import 'package:podcast_app/presentation/pages/create_podcast/widgets/create_podcast_widget.dart';
import 'package:podcast_app/repository/CreatePodcastRepository.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('CreateChannelWidget contains Form', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => CreatePodcastBloc(
            CreatePodcastInitialState(),
            CreatePodcastRepository(
                CreatePodcastProvider(httpClient: http.Client()))),
        child: MaterialApp(
          home: CreatePodcastWidget(
            channelId: "",
          ),
        ),
      ),
    );
    var formFinder = find.byType(Form);
    expect(formFinder, findsOneWidget);
  });

  testWidgets('CreateChannelWidget contains some widgets',
      (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => CreatePodcastBloc(
            CreatePodcastInitialState(),
            CreatePodcastRepository(
                CreatePodcastProvider(httpClient: http.Client()))),
        child: MaterialApp(
          home: CreatePodcastWidget(
            channelId: "",
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
}
