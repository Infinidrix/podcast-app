import 'dart:convert';

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

      response1 = await httpClient.delete(
          Uri.parse("http://$URL/api/Users/$userId/Audios/${podcast.id}"));
      // TODO:
      response = await httpClient.get(Uri.parse(
          "http://$URL/api/Users/$userId/channel/yourchannel/${channel.Id}"));
    } catch (e) {
      return left('Error');
    }
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);
      return Right(Channel.fromJson(parsed));
    } else {
      return left("ERROR");
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
      response1 = await httpClient.patch(
          Uri.parse("http://$URL/api/Users/$userId/Audios/${podcast.id}"),
          body: jsonEncode(
              {"Title": podcast.name, "Description": podcast.description}));
      response = await httpClient.get(
          Uri.parse("http://$URL/api/Users/$userId/channel/${channel.Id}"));
    } catch (e) {
      print("catch error");
      return left("Error");
    }

    print("response : ${response.statusCode}");
    print("response1 : ${response1.statusCode}");
    if (response.statusCode == 200 && response1.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);
      return Right(Channel.fromJson(parsed));
    } else {
      print("KEFT");
      return Left("Error");
    }
  }
}
