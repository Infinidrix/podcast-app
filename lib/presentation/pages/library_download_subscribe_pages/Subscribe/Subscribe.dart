import 'package:flutter/material.dart';


import '../Constants.dart';
import 'Widgets/SubscribedCard.dart';


class Subscribed extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;

  Subscribed({ required this.subtitle,required this.title, required this.description}) ;


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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                        flex: 15,
                        child: ListView(
                          children: [
                            SubscribedCard(
                              title: this.title,
                              subtitle: this.subtitle,
                              description: this.description,
                            ),
                            SubscribedCard(
                              title: this.title,
                              subtitle: this.subtitle,
                              description: this.description,
                            ),SubscribedCard(
                              title: this.title,
                              subtitle: this.subtitle,
                              description: this.description,
                            ),SubscribedCard(
                              title: this.title,
                              subtitle: this.subtitle,
                              description: this.description,
                            ),SubscribedCard(
                              title: this.title,
                              subtitle: this.subtitle,
                              description: this.description,
                            ),
                          ],
                        ))
                  ],
                ),
              )),
        ),
      ],
    ) ;
  }
}
