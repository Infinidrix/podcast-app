import 'package:json_annotation/json_annotation.dart';

import 'Podcast.dart';

part 'Channel.g.dart';

@JsonSerializable()
class Channel {
  final String id;
  final String name;
  final String ImageUrl;
  final int Subscribers;
  final String Desctiption;
  final List<Podcast> Podcasts;

  Channel(
      {required this.name,
      required this.ImageUrl,
      required this.Subscribers,
      required this.id,
      required this.Desctiption,
      required this.Podcasts});

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
