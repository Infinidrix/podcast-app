import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/subscription/subscription_bloc.dart';
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
                      return Center(
                          child: Text("You have no subscribed channels"));
                    }
                    return Column(
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
