import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/edit_channel/IEditChannelProvider.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:http/http.dart' as http;

class EditChannelProvider extends IEditChannelProvider {
  final http.Client httpClient;

  EditChannelProvider({required this.httpClient});

  @override
  Future<Either<String, Channel>> deletePodcast(
      Podcast podcast, Channel channel) async {
    http.Response response;
    try {
      // TODO:
      response = await httpClient.get(Uri.parse(
          "'http://192.168.0.131:44343/api/channel/yourchannel/176684b8-461c-41b0-b414-fc0bf49bd8fc'"));
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
      response = await httpClient.get(Uri.parse(
          "'http://192.168.0.131:44343/api/channel/yourchannel/176684b8-461c-41b0-b414-fc0bf49bd8fc'"));
    } catch (e) {
      return left("Error");
    }
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);
      return Right(Channel.fromJson(parsed));
    } else {
      return Left("Error");
    }
  }
}
