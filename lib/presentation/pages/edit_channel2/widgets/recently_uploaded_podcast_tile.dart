import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_bloc.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_event.dart';

import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RecentlyUploadedPodcast extends StatelessWidget {
  Podcast podcast;
  Channel channel;
  RecentlyUploadedPodcast({
    Key? key,
    required this.podcast,
    required this.channel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editBloc = BlocProvider.of<EditChannelBloc>(context);
    return ListTile(
        leading: Image.asset("assets/images/placeholder.jpg"),
        title: Text(podcast.name),
        subtitle: Text(podcast.description),
        trailing: PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              // TODO : REDIRECT TO EDIT OR CALL DELETE FUNCTION
              if (value == 2) {
                print("CALL DELETE CONFIRM DIALOG");
                _showDeleteDialog(context, podcast, channel);
              }
              if (value == 1) {
                print("open popup");
                _openPopup(context, podcast, channel);
              }
              print("VALUE $value");
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.edit,
                                color: Colors.amber[100], size: 18),
                          ),
                          TextSpan(
                              text: "  Edit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child:
                                Icon(Icons.delete, color: Colors.red, size: 18),
                          ),
                          TextSpan(
                            text: " Delete",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    value: 2,
                  ),
                ]));
  }
}

void _showDeleteDialog(BuildContext context, Podcast podcast, Channel channel) {
  final editBloc = BlocProvider.of<EditChannelBloc>(context);
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are You Sure You Want to Delete?"),
          title: Text("Confirm"),
          actions: [
            TextButton(
                onPressed: () {
                  editBloc.add(
                      DeletePodcastEvent(podcast: podcast, channel: channel));
                  Navigator.of(context).pop();
                },
                child: Text("YES")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("CANCEL"))
          ],
        );
      });
}

_openPopup(context, Podcast podcast, Channel channel) {
  final editBloc = BlocProvider.of<EditChannelBloc>(context);
  final nameController = TextEditingController(text: podcast.name);
  final descriptionController =
      TextEditingController(text: podcast.description);
  Alert(
      context: context,
      title: "Edit Podcast",
      style: AlertStyle(titleStyle: TextStyle(color: Colors.white)),
      content: Column(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              icon: Icon(Icons.title),
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              icon: Icon(Icons.description),
              labelText: 'Description',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          color: HexColor("#579eb5"),
          onPressed: () {
            Podcast newP = Podcast(
                name: nameController.text,
                url: podcast.url,
                id: podcast.id,
                channelName: podcast.channelName,
                description: descriptionController.text);
            editBloc.add(EditPodcastEvent(podcast: newP, channel: channel));
            Navigator.pop(context);
          },
          child: Text(
            "UPDATE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
