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
    final response = await httpClient.get(Uri.parse(
        'http://$URL/api/users/b7d27747-e66f-403d-8bcb-2125656ccb53/Subscriptions/9830371b-97f7-4655-8ebc-d9837be8edf7'));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Channel> getChannel(String id) async {
    final response =
        await httpClient.get(Uri.parse("http://$URL/api/channel/$id"));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);
      return Channel.fromJson(parsed);
    } else {
      print("Some error");
      throw Exception();
    }
  }

  @override
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus) async {
    if (subscriptionStatus) {
      final response = await httpClient.put(Uri.parse(
          'http://$URL/api/users/b7d27747-e66f-403d-8bcb-2125656ccb53/Subscriptions/9830371b-97f7-4655-8ebc-d9837be8edf7'));

      if (response.statusCode == 200) {
        return true;
      } else {
        throw SocketException("Response Code: ${response.statusCode}");
      }
    } else {
      final response = await httpClient.delete(Uri.parse(
          'http://$URL/api/users/b7d27747-e66f-403d-8bcb-2125656ccb53/Subscriptions/9830371b-97f7-4655-8ebc-d9837be8edf7'));

      if (response.statusCode == 200) {
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
