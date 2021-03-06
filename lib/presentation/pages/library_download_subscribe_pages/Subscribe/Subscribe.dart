import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/subscription/subscription_bloc.dart';
import 'package:podcast_app/application/subscription/subscription_events.dart';
import 'package:podcast_app/application/subscription/subscription_states.dart';

import '../Constants.dart';
import 'Widgets/SubscribedCard.dart';

class Subscribed extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;

  Subscribed(
      {required this.subtitle, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    SubscriptionBloc subscriptionBloc =
        BlocProvider.of<SubscriptionBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
              color: mainBackGroundColor,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: BlocConsumer<SubscriptionBloc, SubscriptionState>(
                    builder: (context, state) {
                  if (state is InitialSubscriptionState) {
                    if (state.channels.length == 0) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          subscriptionBloc.add(LoadInitialSubscriptionEvent());
                        },
                        child: Center(
                            child: ListView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                children: [
                              Center(
                                  child: Text(
                                "You have no subscribed channels",
                                style: TextStyle(color: Colors.grey),
                              ))
                            ])),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        subscriptionBloc.add(LoadInitialSubscriptionEvent());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              flex: 15,
                              child: ListView.builder(
                                itemBuilder: (context, index) => SubscribedCard(
                                  channel: state.channels[index],
                                ),
                                itemCount: state.channels.length,
                              ))
                        ],
                      ),
                    );
                  } else if (state is FailedSubscriptionState) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        subscriptionBloc.add(LoadInitialSubscriptionEvent());
                      },
                      child: Center(
                          child: ListView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: [
                            Center(
                                child: Text(
                              "Internet Error. Please Try again",
                              style: TextStyle(color: Colors.grey),
                            ))
                          ])),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }, listener: (context, state) {
                  if (state is FailedSubscriptionState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${state.errorMessage}"),
                      duration: Duration(seconds: 2),
                    ));
                  }
                }),
              )),
        ),
      ],
    );
  }
}
