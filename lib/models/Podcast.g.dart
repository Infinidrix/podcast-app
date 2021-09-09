// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Podcast _$PodcastFromJson(Map<String, dynamic> json) {
  return Podcast(
    name: json['name'].toString(),
    url: json['url'].toString(),
    imageUrl: json['imageUrl'].toString(),
    id: json['id'].toString(),
    numberOfListeners: json['numberOfListeners'] as int?,
    channelName: json['channelName'].toString(),
    description: json['description'].toString(),
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
