import 'package:json_annotation/json_annotation.dart';
import 'package:podcast_app/models/Podcast.dart';

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

  Channel.fromJson(Map<String, dynamic> json)
      : Id = json['id'],
        Name = json['name'],
        ImageUrl = json['url'],
        Description = json['description'],
        Subscribers = json['subscribers'],
        Podcasts = (json['podcasts'] as List<dynamic>)
            .map((e) => Podcast.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'Id': Id,
        'Name': Name,
        'Description': Description,
        "Subscribers": Subscribers,
        "Podcasts": Podcasts
      };
}
