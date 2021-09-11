import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/channel/Channel.dart';

abstract class IYourChannelRepository {
  Future<Either<String, List<Channel>>> getMyChannels();
}
