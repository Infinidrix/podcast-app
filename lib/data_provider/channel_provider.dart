import 'package:podcast_app/data_provider/Ichannel_provider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/models/CreateChannel.dart';
import 'constants.dart';

class ChannelPorvider implements IChannelProvider {
  final http.Client httpClient;

  ChannelPorvider({required this.httpClient});

  List<Podcast> podcasts =
      List.generate(10, (index) => Podcast("Name #$index", index));
  Channel channel = Channel(
      Name: "Name",
      ImageUrl: "ImageUrl",
      Subscribers: 12335245,
      Id: "1",
      Description: "This is some description about the channel",
      Podcasts: List.generate(10, (index) => Podcast("Name #$index", index)));
  bool isSubscribedValue = true;
  @override
  Future<bool> isSubscribed(String userId, String channelId) async {
    Future.delayed(Duration(seconds: 2));
    return isSubscribedValue;
  }

  @override
  Future<Channel> getChannel(String id) async {
    // TODO: implement getChannel
    Future.delayed(Duration(seconds: 2));
    return channel;
  }

  @override
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus) async {
    // TODO: implement setSubscription
    isSubscribedValue = subscriptionStatus;
    return isSubscribedValue;
  }

  @override
  Future<Either<String, Channel>> createChannel({required Map<String, dynamic> createChannelInfo}) async{
      try{
        final response = await httpClient.post(Uri.http(URL, "/api/createChannel"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(createChannelInfo),
        );
        if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        print(parsed);
        return right(Channel.fromJson(parsed));
      } else if (response.statusCode == 400) {
        final parsed = json.decode(response.body);
        return left(parsed["message"]);
      } else if (response.statusCode == 404) {
        return left("Can not connect to internet");
      }
      return left("Some Error Happened");
    } on SocketException catch (e) {
      print(e.message);
      return left("Can not connect to internet ${e.runtimeType}");
    }
        

  }
}
