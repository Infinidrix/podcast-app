import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/data_provider/login/login_provider.dart';

import 'package:podcast_app/data_provider/search_page_provider/ISearch_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/data_provider/constants.dart';

class SearchProvider extends ISearchProvider {
  final http.Client httpClient;

  SearchProvider({required this.httpClient});

  List<Podcast> podcasts = List.generate(
      5,
      (index) => Podcast(
            name: "Podcast $index",
            numberOfListeners: 0,
            url: "",
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
                    description: "",
                    channelName: "",
                    url: "",
                    imageUrl: "assets/images/placeholder.jpg",
                    id: "$index",
                  ))));

  Future<Either<String, List<Channel>>> searchChannel(String search) async {
    http.Response? response;
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"].toString();

    try {
      String? userId = await LoginProvider.SESSION.getString("userId");
      response = await httpClient.get(
          Uri.parse('http://$URL/api/Users/$userId/channel/search/$search'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}'
          }).timeout(Duration(seconds: 5));
    } catch (e) {
      // final parsed = json.decode(response.body);
      print("ERROR");
      return left(e.toString());
    }
    if (response.statusCode == 401) {
      return left("UnAuthorized");
    }

    if (response.statusCode == 200) {
      Iterable parsed = json.decode(response.body);
      List<Channel> channels =
          List<Channel>.from(parsed.map((e) => Channel.fromJson(e)));
      print("PRINT C");
      print(channels);
      return Right(channels);
    } else {
      // final parsed = json.decode(response.body);
      // print(parsed);
      print(response.statusCode);
      return left('parsed.toString()');
    }
  }

  @override
  Future<List<Podcast>> searchPodcast(String search) async {
    Future.delayed(Duration(seconds: 2));
    return podcasts;
  }

  @override
  Future<List<Channel>> recentlySearchedChannel() async {
    Future.delayed(Duration(seconds: 2));
    return channels;
  }

  @override
  Future<List<Podcast>> recentlySearchedPodcast() async {
    Future.delayed(Duration(seconds: 2));
    return podcasts;
  }
}
