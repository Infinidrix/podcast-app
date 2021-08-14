

import 'package:flutter/material.dart';

import 'Download/Download.dart';
import 'Library/Library.dart';
import 'Subscribe/Subscribe.dart';

class LibraryDownloadSub_TabMenuPage extends StatefulWidget {
  const LibraryDownloadSub_TabMenuPage({Key? key}) : super(key: key);

  @override
  _LibraryDownloadSub_TabMenuPageState createState() => _LibraryDownloadSub_TabMenuPageState();
}

class _LibraryDownloadSub_TabMenuPageState extends State<LibraryDownloadSub_TabMenuPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff121212),
          title: Text(
            'Your Library',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          elevation: 0,
          bottom:PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: EdgeInsets.fromLTRB(16, 0, 15, 0),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xff579EB5),width: 2),
                ),
                tabs: [
                  Tab(
                    child: Text('Episodes'),
                  ),
                  Tab(
                    child: Text('Download'),
                  ),
                  Tab(
                    child: Text('Subscribe'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            LibraryPage(
              when: "Yesterday",
              title: '#250- Joe Kisses Danny',
              description: 'On this episode, we dive into Danny dream where Joe Kissed her at a party ... we also dive into the dark underworld of the Karens.',
              subtitle:'The Basement Yard ',
              duration:  "1HR 10MIN",

            ),

            DownloadPage(),
            Subscribed(title: '#250- Joe Kisses Danny',
              description: 'On this episode, we dive into Danny dream where Joe Kissed her at a party ... we also dive into the dark underworld of the Karens.',
              subtitle:'The Basement Yard ',)
          ],
        ),





      ),

    );
  }
}
