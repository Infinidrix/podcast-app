import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:podcast_app/data_provider/library_provider/Ilibrary_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

import '../constants.dart';

class LibraryProviderOnline extends ILibraryProvider {
  final http.Client httpClient;

  LibraryProviderOnline({required this.httpClient});

  @override
  Future<List<Podcast>> getRecentPodcasts(String userId) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"] as String;
    // TODO: Change this to actual user id
    final response = await httpClient.get(
        Uri.parse(
            'http://$URL/api/users/${await LoginProvider.SESSION.getString('userId')}/Audios/Subscribed'),
        headers: {
          'Authorization': 'Bearer ${token}',
        }).timeout(Duration(seconds: 5));
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
