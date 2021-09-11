import 'dart:convert';
import 'dart:io';

import 'package:podcast_app/data_provider/constants.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/data_provider/subscription_provider/ISubscriptionProvider.dart';
import 'package:podcast_app/models/channel/Channel.dart';

import 'package:http/http.dart' as http;

class OnlineSubscriptionProvider extends ISubscriptionProvider {
  final http.Client httpClient;

  OnlineSubscriptionProvider(this.httpClient);

  @override
  Future<List<Channel>> getSubscribedChannels(String userId) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();
    final response = await httpClient.get(
        Uri.parse('http://$URL/api/users/$userId/Subscriptions'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${token}'
        }).timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      Iterable parsed = json.decode(response.body);
      List<Channel> channels =
          List<Channel>.from(parsed.map((e) => Channel.fromJson(e)));
      return channels;
    } else {
      print("SOCKET EXCEPTION");
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }

  //TODO: If you're going to use this endpoint tell Biruk, he didn't fix it.
  @override
  Future<Null> unsubscribe(String channelId, String userId) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();
    final response = await httpClient.put(
        Uri.http(URL,
            "/api/users/$userId/subscribed/channels/$channelId/unsubscribe"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${token}'
        });
  }
}
