import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:podcast_app/data_provider/create_podcast_provider/I_create_podcast_provider.dart';
import 'package:podcast_app/data_provider/constants.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';

class CreatePodcastProvider extends ICreatePodcastProvider {
  final http.Client httpClient;

  CreatePodcastProvider({required this.httpClient});
  @override
  Future<Podcast?> createPodcast(String filePath, String podcastTitle,
      String podcastDescription, String channelId, String userId) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();
    var request = MultipartRequest(
      'POST',
      Uri.parse('http://$URL/api/audio/'),
    )
      ..fields.addAll({
        "title": podcastTitle,
        "description": podcastDescription,
        "channel_id": channelId,
        "user_id": userId
      })
      ..files.add(
        await MultipartFile.fromPath(
          "path",
          filePath,
        ),
      );

    request.headers.addAll({
      'Authorization': 'Bearer ${token}',
    });
    StreamedResponse? response;
    try {
      response = await request.send();
    } catch (e) {
      return null;
    }

    if (response.statusCode == 200) {
      return Podcast.fromJson(
        jsonDecode(
          await response.stream.bytesToString(),
        ),
      );
    } else {
      print(response.statusCode.toString());
      return null;
    }
  }

  @override
  Future<Channel> getChannel(String id) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();
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
}
