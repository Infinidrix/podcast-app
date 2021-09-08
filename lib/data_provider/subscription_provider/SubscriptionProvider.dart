import 'dart:convert';
import 'dart:io';

import 'package:podcast_app/data_provider/constants.dart';
import 'package:podcast_app/data_provider/subscription_provider/ISubscriptionProvider.dart';
import 'package:podcast_app/models/Channel.dart';

import 'package:http/http.dart' as http;

class OnlineSubscriptionProvider extends ISubscriptionProvider {
  final http.Client httpClient;

  OnlineSubscriptionProvider(this.httpClient);

  @override
  Future<List<Channel>> getSubscribedChannels(String userId) async {
    final response =
        await httpClient.get(Uri.http(URL, "/api/users/$userId/subscribed"));
    if (response.statusCode == 200) {
      Iterable parsed = json.decode(response.body);
      List<Channel> channels =
          List<Channel>.from(parsed.map((e) => Channel.fromJson(e)));
      return channels;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }

  @override
  Future<Null> unsubscribe(String channelId, String userId) async {
    final response = await httpClient.put(Uri.http(
        URL, "/api/users/$userId/subscribed/channels/$channelId/unsubscribe"));
  }
}
