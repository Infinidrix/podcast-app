import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/download/download_bloc.dart';
import 'package:podcast_app/application/download/download_states.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';

import 'Download/Download.dart';
import 'Library/Library.dart';
import 'Subscribe/Subscribe.dart';

class LibraryDownloadSubTabMenuPage extends StatefulWidget {
  const LibraryDownloadSubTabMenuPage({Key? key}) : super(key: key);

  @override
  _LibraryDownloadSubTabMenuPageState createState() =>
      _LibraryDownloadSubTabMenuPageState();
}

class _LibraryDownloadSubTabMenuPageState
    extends State<LibraryDownloadSubTabMenuPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadBloc, DownloadState>(
      builder: (context, downloadState) => DefaultTabController(
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
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: EdgeInsets.fromLTRB(16, 0, 15, 0),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(color: Color(0xff579EB5), width: 2),
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
                // BlocProvider(create: (context) => )
                // (child:
                LibraryPage(),
                // ),

                DownloadPage(),
                Subscribed(
                  title: '#250- Joe Kisses Danny',
                  description:
                      'On this episode, we dive into Danny dream where Joe Kissed her at a party ... we also dive into the dark underworld of the Karens.',
                  subtitle: 'The Basement Yard ',
                )
              ],
            ),
            bottomNavigationBar: getBottomNavBar(context)),
      ),
      listener: (context, state) {
        if (state is FailedDownloadState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(children: [
              Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
              ),
              Text("${state.errorMessage}")
            ]),
            duration: Duration(seconds: 2),
          ));
        } else if (state is FailedLoadedDownloadState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(children: [
              Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
              ),
              Text("${state.errorMessage}")
            ]),
            duration: Duration(seconds: 2),
          ));
        } else if (state is InformationalLoadedDownloadState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
              Text("${state.message}")
            ]),
            duration: Duration(seconds: 2),
          ));
        }
      },
    );
  }
}
