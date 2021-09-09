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
    Future.delayed(Duration(seconds: 2));
    return channels[0];
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
  Future<Either<String, Channel>> createChannel(
      {required Map<String, dynamic> createChannelInfo}) async {
    //   try{
    //     final response = await httpClient.post(Uri.http(URL, "/api/createChannel"),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(createChannelInfo),
    //     );
    //     if (response.statusCode == 200) {
    //     final parsed = json.decode(response.body);
    //     print(parsed);
    //     return right(Channel.fromJson(parsed));
    //   } else if (response.statusCode == 400) {
    //     final parsed = json.decode(response.body);
    //     return left(parsed["message"]);
    //   } else if (response.statusCode == 404) {
    //     return left("Can not connect to internet");
    //   }
    //   return left("Some Error Happened");
    // } on SocketException catch (e) {
    //   print(e.message);
    //   return left("Can not connect to internet ${e.runtimeType}");
    // }

    return right(Channel(
        Name: "this",
        ImageUrl: "is",
        Subscribers: 0,
        Id: "Id",
        Description: "Description"));
  }

  Future<Either<String, Channel>> editChannel({required Map<String, dynamic> editChannelInfo}) async {
      //   try{
    //     final response = await httpClient.put(Uri.http(URL, "/api/editChannel"),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(editChannelInfo),
    //     );
    //     if (response.statusCode == 201) {
    //     final parsed = json.decode(response.body);
    //     print(parsed);
    //     return right(Channel.fromJson(parsed));
    //   } else if (response.statusCode == 400) {
    //     final parsed = json.decode(response.body);
    //     return left(parsed["message"]);
    //   } else if (response.statusCode == 404) {
    //     return left("Can not connect to internet");
    //   }
    //   return left("Some Error Happened");
    // } on SocketException catch (e) {
    //   print(e.message);
    //   return left("Can not connect to internet ${e.runtimeType}");
    // }
    return right(Channel(
        Name: "this",
        ImageUrl: "is",
        Subscribers: 0,
        Id: "Id",
        Description: "Description"));
  }
}
