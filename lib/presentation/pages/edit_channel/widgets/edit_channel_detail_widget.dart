import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podcast_app/application/edit_channel_detail/edit_channel_detail_bloc.dart';
import 'package:podcast_app/application/edit_channel_detail/edit_channel_detail_event.dart';
import 'package:podcast_app/application/edit_channel_detail/edit_channel_detail_state.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EditChannelDetailWidget extends StatelessWidget {
  final Channel channel;

  EditChannelDetailWidget({required this.channel});

  final _formKey = GlobalKey<FormState>();
  var nameTextController = TextEditingController();
  var descriptionTextController = TextEditingController();
  ImagePicker? _image = ImagePicker();

  Widget getFormField(Icon icon, int lineCount, String hint,
      TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field can't be empty";
          }
          return null;
        },
        controller: textEditingController,
        minLines: lineCount,
        maxLines: lineCount,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          helperStyle: TextStyle(color: Colors.white),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          fillColor: Colors.white,
          prefixIcon: icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final channelBloc = BlocProvider.of<EditChannelDetailBloc>(context);
    nameTextController.text = channel.name;
    descriptionTextController.text = channel.description;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: BlocConsumer<EditChannelDetailBloc, EditChannelDetailState>(
        listener: (context, editchannelstate) {
          if (editchannelstate is EditChannelDetailSuccessState) {
            context.router.push(YourChannelsRoute());
          }
          // if(editchannelstate is EditChannelDetailErrorState) {
          //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: Text("Error"),
          //       duration: Duration(seconds: 5),
          //     ));
          // }
        },
        builder: (context, editchannelstate) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0.0),
            child: Form(
              key: _formKey,
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Edit Channel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 130,
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: BlocBuilder<EditChannelDetailBloc,
                            EditChannelDetailState>(
                          builder: (context, editChannelState) {
                            return editChannelState
                                    is EditChannelDetailImageUploadedState
                                ? CircleAvatar(
                                    radius: 500,
                                    backgroundImage: FileImage(
                                        File(editChannelState.Image.path)),
                                  )
                                : CircleAvatar(
                                    radius: 500,
                                    backgroundImage:
                                        AssetImage(channel.profile_pic));
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Cover Photo",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 60.0),
                    ),
                    Text(
                      "Channel Name",
                      style: TextStyle(color: Colors.grey),
                    ),
                    getFormField(Icon(Icons.mic_none), 1,
                        "The name of the channel", nameTextController),
                    Text(
                      "Description",
                      style: TextStyle(color: Colors.grey),
                    ),
                    getFormField(
                        Icon(Icons.description_outlined),
                        3,
                        "Description of the channel",
                        descriptionTextController),
                    saveButton(context, channelBloc, editchannelstate),
                  ],
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget saveButton(BuildContext context, EditChannelDetailBloc editChannelBloc,
      EditChannelDetailState editChannelState) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [HexColor("#579EB5"), HexColor("#8EB9C7")]),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              editChannelBloc.add(EditChannelDetailSaveEvent(
                  Name: nameTextController.text,
                  Description: descriptionTextController.text,
                  ChannelID: channel.id,
                  Image: editChannelState is EditChannelDetailImageUploadedState
                      ? editChannelState.Image
                      : ""));
              context.router.push(YourChannelsRoute());
            } else {
              print("Error");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Center(
                child: Text("Save"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    dynamic image;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return BlocBuilder<EditChannelDetailBloc, EditChannelDetailState>(
              builder: (context, editChannelState) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library'),
                        onTap: () async {
                          image = await _image?.pickImage(
                              source: ImageSource.gallery);
                          BlocProvider.of<EditChannelDetailBloc>(context).add(
                              EditChannelChangeImageButtonPressedEvent(
                                  Image: image));
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () async {
                        image =
                            await _image?.pickImage(source: ImageSource.camera);
                        BlocProvider.of<EditChannelDetailBloc>(context).add(
                            EditChannelChangeImageButtonPressedEvent(
                                Image: image));
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
