// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Podcast _$PodcastFromJson(Map<String, dynamic> json) {
  return Podcast(
    name: json['name'] as String,
    url: json['url'] as String,
    imageUrl: json['imageUrl'] as String?,
    id: json['id'] as String,
    numberOfListeners: json['numberOfListeners'] as int?,
    channelName: json['channelName'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$PodcastToJson(Podcast instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'id': instance.id,
      'numberOfListeners': instance.numberOfListeners,
      'channelName': instance.channelName,
      'description': instance.description,
    };
