import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/edit_channel/IEditChannelProvider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/data_provider/constants.dart';

class EditChannelProvider extends IEditChannelProvider {
  final http.Client httpClient;

  EditChannelProvider({required this.httpClient});

  @override
  Future<Either<String, Channel>> deletePodcast(
      Podcast podcast, Channel channel) async {
    http.Response response;
    http.Response response1;
    try {
      String? userId = await LoginProvider.SESSION.getString('userId');
      print("BEFORE");
      print(userId);
      print(podcast.id);
      response1 = await httpClient.delete(
          Uri.parse("http://$URL/api/Users/$userId/Audios/${podcast.id}"));
      // TODO:
      response = await httpClient.get(
          Uri.parse("http://$URL/api/Users/$userId/channel/${channel.Id}"));
    } catch (e) {
      return left('Error');
    }
    print("REsponse 1 ${response1.statusCode}");
    print("REsponse ${response.statusCode}");
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);
      return Right(Channel.fromJson(parsed));
    } else {
      return left("ERROR${response.statusCode}");
    }
  }

  @override
  Future<Either<String, Channel>> editPodcast(
      Podcast podcast, Channel channel) async {
    http.Response response;
    http.Response response1;
    try {
      String? userId = await LoginProvider.SESSION.getString('userId');
      print("I've got the fucking userId $userId");
      print("\n\nPodcast id ${podcast.id}");
      response1 = await httpClient.patch(
          Uri.parse("http://$URL/api/Users/$userId/Audios/${podcast.id}"),
          body: json.encode(
              {"Title": podcast.name, "Description": podcast.description}),
          headers: {
            "Content-Type": "application/json",
          });
      response = await httpClient.get(
          Uri.parse("http://$URL/api/Users/$userId/channel/${channel.Id}"));
    } catch (e) {
      print("catch error");
      return left("Error: ffff");
    }

    print("response : ${response.statusCode}");
    print("response1 : ${response1.statusCode}");
    if (response.statusCode == 200 && response1.statusCode == 202) {
      final parsed = json.decode(response.body);
      print(parsed);
      return Right(Channel.fromJson(parsed));
    } else {
      print("KEFT");
      return left("Error");
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
