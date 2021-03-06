import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker extends StatelessWidget {
  final double maxImageWidth;
  final double maxImageHeight;
  final Function(XFile?) onImageSelected;

  const AppImagePicker(
      {required this.maxImageWidth,
      required this.maxImageHeight,
      required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.camera_alt),
      iconSize: 50.0,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                  title: Text("Camera/Gallery"),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () async {
                        Navigator.pop(context); //close the dialog box
                        _getImage(ImageSource.gallery);
                      },
                      child: const Text('Pick From Gallery'),
                    ),
                    SimpleDialogOption(
                      onPressed: () async {
                        Navigator.pop(context); //close the dialog box
                        _getImage(ImageSource.camera);
                      },
                      child: const Text('Take A New Picture'),
                    ),
                  ]);
            });
      },
    );
  }

  Future _getImage(ImageSource src) async {
    final picker = ImagePicker();
    var img = await picker.pickImage(
        source: src, maxHeight: maxImageHeight, maxWidth: maxImageWidth);
    if (onImageSelected != null) {
      onImageSelected(img);
    }
  }
}
