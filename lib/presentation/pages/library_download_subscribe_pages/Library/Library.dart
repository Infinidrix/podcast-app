import 'package:flutter/material.dart';

import 'Widgets/LibraryCard.dart';
import 'Widgets/firstRow.dart';


const Color mainBackGroundColor = Color(0xff121212);

class LibraryPage extends StatelessWidget {
  final String when;
  final String title;
  final String description;
  final String duration;
  final String subtitle;

   LibraryPage({ required this.subtitle,required this.when,required this.title, required this.description,required this.duration}) ;

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
                    firstRowLibrary(when: when)
                    ,
                    Expanded(
                        flex: 15,
                        child: ListView(
                          children: [
                            LibraryCard(
                              title: this.title,
                              subtitle: this.subtitle,
                              description: this.description,
                              duration: this.duration,
                              when:when,
                            ), LibraryCard(
                              title: this.title,
                              subtitle: this.subtitle,
                              description: this.description,
                              duration: this.duration,
                              when:when,
                            ), LibraryCard(
                              title: this.title,
                              subtitle: this.subtitle,
                              description: this.description,
                              duration: this.duration,
                              when:when,
                            )
                          ],
                        ))
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
