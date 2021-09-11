import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcast_app/application/create_channel/create_channel_bloc.dart';
import 'package:podcast_app/data_provider/channel_provider.dart';
import 'package:podcast_app/presentation/pages/create_channel/widgets/create_channel_widget.dart';
import 'package:podcast_app/repository/ChannelRepository.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets("Testing the signin page has some widgets.",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CreateChannelBloc(
                  channelRepository: ChannelRepository(
                      channelProvider:
                          ChannelPorvider(httpClient: http.Client())))),
        ],
        child: MaterialApp(
          home: CreateChannelWidget(),
        ),
      ),
    );

    expect(find.text("Create Channel"), findsOneWidget);
    expect(find.text("Channel Name"), findsOneWidget);
    expect(_getNameField(), findsOneWidget);
  });
}

Finder _getNameField() {
  WidgetPredicate widgetPredicate = (Widget widget) =>
      widget is Text &&
      widget.data == "Channel Name" &&
      widget.style == TextStyle(color: Colors.grey);

  return find.byWidgetPredicate(widgetPredicate);
}
