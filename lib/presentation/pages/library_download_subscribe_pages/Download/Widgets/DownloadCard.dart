import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/download/download_bloc.dart';
import 'package:podcast_app/application/download/download_states.dart';

import '../../Constants.dart';

class DownloadCard extends StatefulWidget {
  final int index;
  const DownloadCard(this.index, {Key? key}) : super(key: key);

  @override
  _DownloadCardState createState() => _DownloadCardState(this.index);
}

class _DownloadCardState extends State<DownloadCard> {
  int index;
  _DownloadCardState(this.index): super();

  @override
  Widget build(BuildContext context) {
    final downloadBloc = BlocProvider.of<DownloadBloc>(context);

    return BlocBuilder<DownloadBloc, DownloadState>(
      builder: (context, state) => (state is LoadedDownloadState) ? Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[ Card(
          margin: EdgeInsets.all(0),
          child: Container(
    
            color: mainBackGroundColor,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:AssetImage('assets/images/placeholder.jpg'),
              ),
              title: Text('${state.podcasts.elementAt(index).name}',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
              subtitle: Text('${state.podcasts.elementAt(index).channelName}',style: TextStyle(color:Color(0xffb3b3b3),fontSize:11,fontWeight: FontWeight.bold ),),
              trailing: (state.index == index) ?
                          CircularProgressIndicator() :
                          (state.index < index) ? 
                            Icon(Icons.hourglass_empty) :
                            Icon(Icons.play_circle_filled_rounded),
            ),
          ),
        ),],
      ) : CircularProgressIndicator(),
    );
  }
}
