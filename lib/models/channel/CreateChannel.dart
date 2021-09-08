import 'dart:convert';
// import 'dart:html';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcast_app/presentation/pages/library_download_subscribe_pages/Subscribe/Subscribe.dart';

class CreateChannel {
  String Description;
  String Name;
  String Url;

  int Subscriber = 0;

  CreateChannel(
      {required this.Description, required this.Name, required this.Url});

  CreateChannel.fromJson(Map<String, dynamic> json)
      : Name = json['Name'],
        Url = json['Url'],
        Description = json['Description'];

  Map<String, dynamic> toJson() =>
      {'Url': Url, 'Name': Name, 'Description': Description};
}
