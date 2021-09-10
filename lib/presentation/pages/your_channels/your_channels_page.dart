import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/your_channels/your_channel_bloc.dart';
import 'package:podcast_app/application/your_channels/your_channel_event.dart';
import 'package:podcast_app/application/your_channels/your_channel_state.dart';
// import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/presentation/core/bottom_navigation.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';
import 'package:podcast_app/presentation/pages/your_channels/widgets/your_channels_widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class YourChannelsPage extends StatelessWidget {
  const YourChannelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yourchannelBloc = BlocProvider.of<YourChannelBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#282828"),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => {context.router.push(CreateChannelRoute())},
      ),
      backgroundColor: HexColor("#1A1A1A"),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          children: [
            YourChannelsAppBar(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: BlocConsumer<YourChannelBloc, YourChannelState>(
                listener: (context, state) {
                  if (state is YourChannelError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error),
                      duration: Duration(milliseconds: 5500),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is LoadingYourChannel) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedYourChannel) {
                    List<Channel> channels = state.channels;

                    return RefreshIndicator(
                      onRefresh: () async {
                        yourchannelBloc.add(IntialYourChannelEvent());
                      },
                      child: ListView.builder(
                        itemCount: channels.length,
                        itemBuilder: (BuildContext context, int index) =>
                            YourChannelTile(
                          channel: channels[index],
                        ),
                      ),
                    );
                  }

                  return Container();
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: getBottomNavBar(context),
    );
  }
}
