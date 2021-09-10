import 'package:http/http.dart';
import 'package:podcast_app/data_provider/Ichannel_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/models/channel/CreateChannel.dart';
import 'constants.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

import 'login/login_provider.dart';

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
  @override
  Future<bool> isSubscribed(String userId, String channelId) async {
    final response = await httpClient
        .get(
            Uri.parse('http://$URL/api/users/$userId/Subscriptions/$channelId'))
        .timeout(Duration(seconds: 7));
    print("This is subscribe ${response.body}");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Channel> getChannel(String id) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"] as String;
    // TODO: Change this to actual user id
    print("Got here");
    final response = await httpClient.get(
        Uri.parse(
            'http://$URL/api/users/${LoginProvider.SESSION.getString('userId')}/channel/$id'),
        headers: {
          'Authorization': 'Bearer ${token}',
        }).timeout(Duration(seconds: 7));
    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      Channel channel = Channel.fromJson(parsed);
      return channel;
    } else {
      print(response.body);
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }

  @override
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus) async {
    if (subscriptionStatus) {
      final response = await httpClient.put(
          Uri.parse('http://$URL/api/users/$userId/Subscriptions/$channelId'));

      if (response.statusCode == 202) {
        return true;
      } else {
        print(response.body);
        throw SocketException("Response Code: ${response.statusCode}");
      }
    } else {
      final response = await httpClient.delete(
          Uri.parse('http://$URL/api/users/$userId/Subscriptions/$channelId'));

      if (response.statusCode == 202) {
        return false;
      } else {
        throw SocketException("Response Code: ${response.statusCode}");
      }
    }
  }

  @override
  Future<Channel?> createChannel(
      {required CreateChannel createChannelInfo}) async {
    String? userId = await LoginProvider.SESSION.getString('userId');

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://$URL/api/users/$userId/channel'),
    )
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
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://$URL/api/channel/$ChannelID'))
      ..fields.addAll({
        "name": editChannelInfo.Name,
        "description": editChannelInfo.Description
      })
      ..files.add(
        await http.MultipartFile.fromPath("imagefile", editChannelInfo.Url),
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
}
