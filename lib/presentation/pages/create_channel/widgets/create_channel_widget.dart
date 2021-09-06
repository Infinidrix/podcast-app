import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podcast_app/application/create_channel/create_channel_bloc.dart';
import 'package:podcast_app/application/create_channel/create_channel_event.dart';
import 'package:podcast_app/application/create_channel/create_channel_state.dart';
import 'package:podcast_app/presentation/pages/create_channel/widgets/image_picker.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreateChannelWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final imageController = TextEditingController();
  late XFile? _image;
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
    final channelBloc = BlocProvider.of<CreateChannelBloc>(context);
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
      body: BlocConsumer<CreateChannelBloc, CreateChannelState>(
        listener: (context, createchannelstate) {
          if (createchannelstate is CreateChannelSuccessState) {
            context.router.push(YourChannelsRoute());
          }
        },
        builder: (context, createchannelstate) {
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
                      "Create Channel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 105.0),
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
                    Text(
                      "Cover Photo",
                      style: TextStyle(color: Colors.grey),
                    ),
                    AppImagePicker(
                        maxImageWidth: 20,
                        maxImageHeight: 20,
                        onImageSelected: (context) {
                          return FileImage(context);
                        }),
                    saveButton(context, channelBloc, createchannelstate),
                  ],
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget saveButton(BuildContext context, CreateChannelBloc createChannelBloc,
      CreateChannelState createChannelState) {
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
              print("Successfully registered!");
              print("Entered");
              createChannelBloc.add(CreateChannelSaveEvent(
                  Name: nameTextController.text,
                  Description: descriptionTextController.text,
                  ImageURL: imageController.text));
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

//   // void _showPicker(context) {
//   // showModalBottomSheet(
//   //     context: context,
//   //     builder: (BuildContext bc) {
//   //       return SafeArea(
//   //         child: Container(
//   //           child: new Wrap(
//   //             children: <Widget>[
//   //               new ListTile(
//   //                   leading: new Icon(Icons.photo_library),
//   //                   title: new Text('Photo Library'),
//   //                   onTap: () {
//   //                     _image = ImagePicker.pickImage(source: ImageSource.gallery);
//   //                     Navigator.of(context).pop();
//   //                   }),
//   //               new ListTile(
//   //                 leading: new Icon(Icons.photo_camera),
//   //                 title: new Text('Camera'),
//   //                 onTap: () {
//   //                   _imgFromCamera();
//   //                   Navigator.of(context).pop();
//   //                 },
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       );
//   //     }
//   //   );
// }
}
