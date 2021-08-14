import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Constants.dart';
import 'Widgets/DownloadCard.dart';
import 'Widgets/ToggleFirstRow.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ToggleRow(),
        Expanded(
            flex: 15,
            child: Container(
              color: mainBackGroundColor,
              child: ListView(

                children: [
                  DownloadCard(),
                  DownloadCard(),
                  DownloadCard(),
                  DownloadCard(),
                  DownloadCard(),
                  DownloadCard(),
                  DownloadCard(),
                  DownloadCard(),
                  DownloadCard(),
                  DownloadCard(),

                ],
              ),
            )),
      ],
    );
  }
}
