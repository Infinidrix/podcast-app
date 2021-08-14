import 'package:flutter/material.dart';

import '../../Constants.dart';


class LibraryCard extends StatelessWidget {
  final String when;
  final String title;
  final String description;
  final String duration;
  final String subtitle;

  LibraryCard(
      {required this.subtitle,
      required this.when,
      required this.title,
      required this.description,
      required this.duration});

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
                                  image: AssetImage('asset/placeholder.jpg'),
                                  fit: BoxFit.cover)),
                        )),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${title}',
                            style: titleTextStyle,
                          ),
                          Text(
                            '${subtitle}',
                            style: descriptioin_SubtitleTextStyle,
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
              Container(
                margin: EdgeInsets.fromLTRB(0, 34, 0, 6),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${when} . ',
                            style: whenTextStyle,
                          ),
                          Text(
                            '${duration}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffb3b3b3),
                                fontSize: 11),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(26, 0, 10, 0),
                            child: Icon(
                              Icons.download_rounded,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
