import 'package:flutter/material.dart';

import '../../Constants.dart';

class SubscribedCard extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;

  SubscribedCard({ required this.subtitle,required this.title, required this.description}) ;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),

      child: Container(
        color: mainBackGroundColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondColor,
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                color: secondColor,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(right: 12),
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/placeholder.jpg'),
                                  fit: BoxFit.cover)),
                        )),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         Container(child:  Text(
                           '${title}',
                           style: titleTextStyle,
                         ),),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text(
                              '${subtitle}',
                              style: descriptioin_SubtitleTextStyle,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  '${description}',
                  style:descriptioin_SubtitleTextStyle,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
