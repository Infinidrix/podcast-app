import 'dart:convert';
import 'dart:io';

import 'package:podcast_app/data_provider/audio_provider/Iaudio_provider.dart';

import 'package:http/http.dart' as http;
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/Channel.dart';

import '../constants.dart';

class AudioProvider implements IAudioProvider {
  final http.Client httpClient;

  AudioProvider({required this.httpClient});

  @override
  Future<Null> addRecentlyPlayed(String id) async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();
    final response = await httpClient.post(
        Uri.parse(
            "http://$URL/api/users/${LoginProvider.SESSION.getString('userId')}/Audios/$id/Played"),
        headers: {
          'Authorization': 'Bearer ${token}',
        }).timeout(Duration(seconds: 7));
    print(
        'This is the response that is here: ${response.body} ${response.statusCode}');
    if (response.statusCode == 202) {
    } else {
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }

  // TODO: remove this, it's probably useless
  Future<Null> downloadPodcast(String id) async {
    await Future.delayed(Duration(seconds: 25), () {
      print("downloaded audio");
    });
  }
}
