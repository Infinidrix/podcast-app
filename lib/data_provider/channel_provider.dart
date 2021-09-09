import 'package:http/http.dart';
import 'package:podcast_app/data_provider/Ichannel_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/models/channel/CreateChannel.dart';
import 'constants.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

class ChannelPorvider implements IChannelProvider {
  final http.Client httpClient;

  ChannelPorvider({required this.httpClient});

  // List<Podcast> podcasts =
  //     List.generate(10, (index) => Podcast("Name #$index", index));
  Channel channel = Channel(
      Name: "Name",
      ImageUrl: "ImageUrl",
      Subscribers: 12335245,
      Id: "1",
      Description: "This is some description about the channel",
      Podcasts: List.generate(
          10,
          (index) => Podcast(
              id: "", channelName: "", description: "", name: "", url: "")));

  List<Podcast> podcasts = List.generate(
      5,
      (index) => Podcast(
            name: "Podcast $index",
            numberOfListeners: 0,
            description: "",
            channelName: "",
            url: "",
            imageUrl: "",
            id: "$index",
          ));
  List<Channel> channels = List.generate(
      5,
      (index) => Channel(
          Name: "Name",
          ImageUrl: "ImageUrl",
          Subscribers: 12335245,
          Id: "$index",
          Description: "This is Channel Description",
          Podcasts: List.generate(
              5,
              (index) => Podcast(
                    name: "Podcast $index",
                    numberOfListeners: 0,
                    channelName: "",
                    description: "",
                    url: "",
                    imageUrl: "",
                    id: "$index",
                  ))));

  bool isSubscribedValue = true;
  @override
  Future<bool> isSubscribed(String userId, String channelId) async {
    Future.delayed(Duration(seconds: 2));
    return isSubscribedValue;
  }

  @override
  Future<Channel> getChannel(String id) async {
    Future.delayed(Duration(seconds: 2));
    return channels[0];
  }

  @override
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus) async {
    isSubscribedValue = subscriptionStatus;
    return isSubscribedValue;
  }

  @override
  Future<Channel?> createChannel(
      {required CreateChannel createChannelInfo}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://localhost:5001/api/channel'))
      ..fields.addAll({
        "name": createChannelInfo.Name,
        "description": createChannelInfo.Description
      })
      ..files.add(
        await http.MultipartFile.fromPath("imagefile", createChannelInfo.Url),
      );

    StreamedResponse? response;

    try {
      response = await request.send();
    } catch (e) {
      return null;
    }

    if (response.statusCode == 200) {
      return Channel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      return null;
    }
  }

  Future<Channel?> editChannel(
      {required CreateChannel editChannelInfo,
      required String ChannelID}) async {
    // return right(Channel(
    //     Name: "this",
    //     ImageUrl: "is",
    //     Subscribers: 0,
    //     Id: "Id",
    //     Description: "Description"));
  }
}
