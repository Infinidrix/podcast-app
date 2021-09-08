import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'Podcast.g.dart';

@JsonSerializable()
class Podcast {
  final String name;
  final String url;
  final String? imageUrl;
  final String id;
  final int? numberOfListeners;
  final String channelName;
  final String description;

  Podcast(
      {required this.name,
      required this.url,
      this.imageUrl,
      required this.id,
      this.numberOfListeners,
      required this.channelName,
      required this.description});

  factory Podcast.fromJson(Map<String, dynamic> json) => _$PodcastFromJson(json);
  Map<String, dynamic> toJson() => _$PodcastToJson(this);
}
