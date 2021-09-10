// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    Name: json['Name'].toString(),
    ImageUrl: json['ImageUrl'].toString(),
    Subscribers: json['Subscribers'] as int,
    Id: json['Id'].toString(),
    Desctiption: json['Desctiption'].toString(),
    Podcasts: (json['Podcasts'] as List<dynamic>)
        .map((e) => Podcast.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'ImageUrl': instance.ImageUrl,
      'Subscribers': instance.Subscribers,
      'Desctiption': instance.Desctiption,
      'Podcasts': instance.Podcasts,
    };
