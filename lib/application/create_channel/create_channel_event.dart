import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class CreateChannelEvent {}

class CreateChannelSaveEvent extends CreateChannelEvent {
  final String Name;
  final String Description;
  final String ImageURL;

  CreateChannelSaveEvent({required this.Name, required this.Description, required this.ImageURL});
}
