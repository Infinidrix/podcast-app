import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:podcast_app/data_provider/library_provider/Ilibrary_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

import '../constants.dart';

class LibraryProviderOnline extends ILibraryProvider {
  final http.Client httpClient;

  LibraryProviderOnline({required this.httpClient});

  @override
  Future<List<Podcast>> getRecentPodcasts(String userId) async {
    print("Getting to the recent podcast API call");
	// TODO: Change this to actual user id
    final response = await httpClient
        .get(Uri.parse('http://$URL/api/users/b7d27747-e66f-403d-8bcb-2125656ccb53/Audios/Subscribed'));
    print("Result from recent podcasts API call: ${response.statusCode}");
    if (response.statusCode == 200) {
      Iterable parsed = json.decode(response.body);
      List<Podcast> podcasts =
          List<Podcast>.from(parsed.map((e) => Podcast.fromJson(e)));
      return podcasts;
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }
}
