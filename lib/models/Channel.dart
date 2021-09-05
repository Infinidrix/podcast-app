
import 'package:json_annotation/json_annotation.dart';

// part 'user.g.dart';

class Channel {
  final String Id;
  final String Name;
  final String ImageUrl;
  final String Description;
  final int Subscribers;
  final List<Podcast>? Podcasts;

  Channel(
      {required this.Name,
      required this.ImageUrl,
      required this.Subscribers,
      required this.Id,
      required this.Description,
      this.Podcasts});

  //     factory Channel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this);
}

class Podcast {
  final String Name;
  final int? NumberOfLitsners;

  Podcast(this.Name, this.NumberOfLitsners);
}
