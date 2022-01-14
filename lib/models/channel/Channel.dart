import 'package:json_annotation/json_annotation.dart';
import 'package:podcast_app/models/Podcast.dart';

// part 'user.g.dart';

class Channel {
  final String id;
  final String name;
  final String profile_pic;
  final String description;
  final int subscriber;
  final int? rate;
  List<Podcast>? podcasts;

  Channel(
      {required this.name,
      required this.profile_pic,
      required this.subscriber,
      required this.id,
      required this.description,
      this.rate,
      this.podcasts});

  //     factory Channel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this);

  Channel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['channel_name'],
        rate = json['rate'],
        profile_pic = json['profile_pic'],
        description = json['description'],
        subscriber = json['subscriber'],
        podcasts = (json['podcasts'] as List<dynamic>)
            .map((e) => Podcast.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        "subscriber": subscriber,
        "podcasts": podcasts,
        "rate": rate
      };
}
