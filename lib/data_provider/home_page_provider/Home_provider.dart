import 'package:podcast_app/data_provider/home_page_provider/IHome_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../constants.dart';

class HomeProvider implements IHomeProvider {
  final http.Client httpClient;

  HomeProvider({required this.httpClient});

  List<Podcast> podcasts = List.generate(
      5,
      (index) => Podcast(
            name: "Podcast $index",
            numberOfListeners: 0,
            url:
                "http://$URL:44343/api/Users/b7d27747-e66f-403d-8bcb-2125656ccb53/Audios/4335478d-dd31-4e00-bdbf-60a2986ad1c0/download.mp3",
            description: "",
            channelName: "",
            imageUrl: "assets/images/placeholder.jpg",
            id: "$index",
          ));
  List<Channel> channels = List.generate(
      5,
      (index) => Channel(
          name: "Name",
          profile_pic: "assets/images/placeholder.jpg",
          subscriber: 12335245,
          id: "$index",
          description: "This is Channel Description",
          podcasts: List.generate(
              5,
              (index) => Podcast(
                    name: "Podcast $index",
                    numberOfListeners: 0,
                    url: "",
                    description: "",
                    channelName: "",
                    imageUrl: "assets/images/placeholder.jpg",
                    id: "$index",
                  ))));

  @override
  Future<List<Podcast>> getRecentlyPlayed() async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();
    final response = await httpClient.get(
        Uri.parse(
            "http://$URL/api/users/${await LoginProvider.SESSION.getString('userId')}/Audios/Recents"),
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

  @override
  Future<List<Channel>> getTopPicks() async {
    // return channels;
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();
    final response = await httpClient.get(
        Uri.parse(
            "http://$URL/api/users/${await LoginProvider.SESSION.getString('userId')}/channel"),
        headers: {
          'Authorization': 'Bearer ${token}',
        }).timeout(Duration(seconds: 7));
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
  Future<List<Podcast>> getTrending() async {
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();
    final response = await httpClient.get(
        Uri.parse(
            "http://$URL/api/users/${await LoginProvider.SESSION.getString('userId')}/Audios/Recents"),
        headers: {
          'Authorization': 'Bearer ${token}',
        }).timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      Iterable parsed = json.decode(response.body);
      List<Podcast> podcasts =
          List<Podcast>.from(parsed.map((e) => Podcast.fromJson(e)));
      return podcasts;
    } else {
      print("Error Occured ${response.body}");
      throw SocketException("Response Code: ${response.statusCode}");
    }
  }
}
