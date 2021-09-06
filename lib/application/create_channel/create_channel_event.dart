import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class CreateChannelEvent {}

class CreateChannelSaveEvent extends CreateChannelEvent {
  final String Name;
  final String Description;
  final String ImageURL;

  CreateChannelSaveEvent({required this.Name, required this.Description, required this.ImageURL});
}
 class ChangeProfileImageButtonPressed extends CreateChannelEvent {}

class OpenImagePickerEvent extends CreateChannelEvent {
  final ImageSource imageSource;

  OpenImagePickerEvent({required this.imageSource});
}