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
          Name: "Name",
          ImageUrl: "assets/images/1by1.png",
          Subscribers: 12335245,
          Id: "$index",
          Description:
              "The Basement Yard is a weekly podcast hosted by Joe Santagato & featuring Danny LoPriore.",
          Podcasts: List.generate(
              5,
              (index) => Podcast(
                    name: "Podcast $index",
                    numberOfListeners: 0,
                    url: "",
                    description: "",
                    channelName: "",
                    imageUrl: "assets/images/1by1.png",
                    id: "$index",
                  ))));
  @override
  Future<Either<String, List<Channel>>> getMyChannels(String userId) async {
    http.Response? response;
    try {
      // final userId = await LoginProvider.SESSION.getString("userId");
      print("YOUR CHANNEL REQUEST");

      String? userId = await LoginProvider.SESSION.getString('userId');
      response = await httpClient
          .get(Uri.parse('http://$URL/api/users/$userId/channel/yourchannel'))
          .timeout(Duration(seconds: 20));
    } catch (e) {
      print("ERROR ${e.toString()}");
      return left(e.toString());
    }
    if (response!.statusCode == 200) {
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
