import 'package:http/http.dart';
import 'package:path/path.dart';
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
  @override
  Future<bool> isSubscribed(String userId, String channelId) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();

    final response = await httpClient.get(
        Uri.parse('http://$URL/api/users/$userId/Subscriptions/$channelId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${token}'
        }).timeout(Duration(seconds: 7));
    print("This is subscribe ${response.body}");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Channel> getChannel(String id) async {
    Channel channel;
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"]['access'];
    // TODO: Change this to actual user id
    print("Got here ${id}");
    // TODO: Change this as soon as possible
    // id = 'da9c196a-ac2b-4a5d-9dfd-13adce101194';
    final channelResponse = await httpClient
        .get(Uri.parse("http://$URL/api/v1/channel/$id/"), headers: {
      'Authorization': 'Bearer ${token}',
    }).timeout(Duration(seconds: 7));
    if (channelResponse.statusCode == 200) {
      var parsed = json.decode(channelResponse.body);
      channel = Channel.fromJson(parsed);
      print("HERE is we ${parsed['channel_name']}");
    } else {
      print(channelResponse.body);
      throw SocketException("Response Code: ${channelResponse.statusCode}");
    }
    final response = await httpClient
        .get(Uri.parse('http://$URL/api/v1/audio/channel/$id/'), headers: {
      'Authorization': 'Bearer ${token}',
    }).timeout(Duration(seconds: 7));
    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      channel.podcasts = (parsed as List<dynamic>)
          .map((e) => Podcast.fromJson(e as Map<String, dynamic>))
          .toList();
      print("These are the channel podcasts ${channel.podcasts}");
    } else {
      print(response.body);
      throw SocketException("Response Code: ${response.statusCode}");
    }
    print(channel.name);
    return channel;
  }

  @override
  Future<bool> setSubscription(
      String userId, String channelId, bool subscriptionStatus) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();

    if (subscriptionStatus) {
      final response = await httpClient.put(
          Uri.parse('http://$URL/api/users/$userId/Subscriptions/$channelId'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}'
          });

      if (response.statusCode == 202) {
        return true;
      } else {
        print(response.body);
        throw SocketException("Response Code: ${response.statusCode}");
      }
    } else {
      final response = await httpClient.delete(
          Uri.parse('http://$URL/api/users/$userId/Subscriptions/$channelId'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}'
          });

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
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://$URL/api/users/$userId/channel'),
    )..fields.addAll({
        "name": createChannelInfo.Name,
        "description": createChannelInfo.Description,
        "ownerId": LoginProvider.SESSION.getString("userId")!.toString()
      });

    request.headers.addAll({
      'Authorization': 'Bearer ${token}',
    });

    StreamedResponse? response;

    try {
      response = await request.send();
    } catch (e) {
      return null;
    }

    print("Status code: ${response.statusCode}");

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
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();

    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'http://$URL/api/Users/${await LoginProvider.SESSION.getString("userId")}/channel/$ChannelID'))
      ..fields.addAll({
        "name": editChannelInfo.Name,
        "description": editChannelInfo.Description,
      });

    request.headers.addAll({
      'Authorization': 'Bearer ${token}',
    });

    StreamedResponse? response;

    try {
      response = await request.send();
    } catch (e) {
      print("staust code : ${response!.statusCode}");
      return null;
    }

    if (response.statusCode == 200) {
      return Channel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print("staust code next : ${response.statusCode}");
      return null;
    }
  }
}
