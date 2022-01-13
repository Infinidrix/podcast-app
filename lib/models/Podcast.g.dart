// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Podcast _$PodcastFromJson(Map<String, dynamic> json) {
  return Podcast(
    name: json['name'].toString(),
    url: json['url'].toString(),
    poster: json['poster'] as String?,
    id: json['id'].toString(),
    numberOfListeners: json['numberOfListeners'] as int?,
    channelName: json['channelName'].toString(),
    description: json['description'].toString(),
  );
}

Map<String, dynamic> _$PodcastToJson(Podcast instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'poster': instance.poster,
      'id': instance.id,
      'numberOfListeners': instance.numberOfListeners,
      'channelName': instance.channelName,
      'description': instance.description,
    };
