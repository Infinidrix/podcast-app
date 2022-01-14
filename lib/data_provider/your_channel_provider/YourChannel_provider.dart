import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/data_provider/your_channel_provider/IYourChannel_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/data_provider/constants.dart';

class YourChannelProvider extends IYourChannelProvider {
  final http.Client httpClient;

  YourChannelProvider({required this.httpClient});
  List<Channel> channels = List.generate(
      5,
      (index) => Channel(
          name: "Name",
          profile_pic: "assets/images/1by1.png",
          subscriber: 12335245,
          id: "$index",
          description:
              "The Basement Yard is a weekly podcast hosted by Joe Santagato & featuring Danny LoPriore.",
          podcasts: List.generate(
              5,
              (index) => Podcast(
                    name: "Podcast $index",
                    numberOfListeners: 0,
                    url: "",
                    description: "",
                    channelName: "",
                    poster: "assets/images/1by1.png",
                    id: "$index",
                  ))));
  @override
  Future<Either<String, List<Channel>>> getMyChannels(String userId) async {
    http.Response? response;
    final user = json.decode(LoginProvider.SESSION.getString("user")!)
        as Map<String, dynamic>;
    String token = user["token"]['access'].toString();
    try {
      // final userId = await LoginProvider.SESSION.getString("userId");
      print("YOUR CHANNEL REQUEST");

      String? userId = "1"; // TODO: DON'T hard code this
      response = await httpClient.get(
          Uri.parse(
              'http://$URL/api/v1/channel/my_channels'), //http://127.0.0.1:9000/api/v1/channel/my_channels
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}'
          }).timeout(Duration(seconds: 20));
    } catch (e) {
      print("ERROR ${e.toString()}");
      return left(e.toString());
    }
    if (response.statusCode == 200) {
      Iterable parsed = json.decode(response.body);
      List<Channel> channels =
          List<Channel>.from(parsed.map((e) => Channel.fromJson(e)));
      print("PRINT C");
      print("STATUS CODE : ${response.statusCode}");

      print(channels);
      return Right(channels);
    } else {
      print("STATUS CODE : ${response.statusCode}");
      // final parsed = json.decode(response.body);
      // print("pasrsed   ${parsed["message"]}");
      return left("404 Error");
    }
  }
}
