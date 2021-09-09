import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:podcast_app/data_provider/create_podcast_provider/I_create_podcast_provider.dart';
import 'package:podcast_app/data_provider/constants.dart';
import 'package:podcast_app/models/Podcast.dart';

class CreatePodcastProvider extends ICreatePodcastProvider {
  @override
  Future<Podcast?> createPodcast(String filePath, String podcastTitle,
      String podcastDescription, String channelId, String? userId) async {
    var request = MultipartRequest(
      'POST',
      Uri.parse('$URL/api/$userId/audios'),
    )
      ..fields.addAll({
        "Title": podcastTitle,
        "Description": podcastDescription,
        "ChannelId": channelId,
      })
      ..files.add(
        await MultipartFile.fromPath(
          "audioFile",
          filePath,
        ),
      );
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
      return null;
    }
  }
}
