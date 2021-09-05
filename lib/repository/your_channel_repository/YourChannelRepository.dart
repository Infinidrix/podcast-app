import 'package:podcast_app/data_provider/your_channel_provider/IYourChannel_provider.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/repository/your_channel_repository/IYourChannelRepository.dart';

class YourChannelRepository extends IYourChannelRepository {
  final IYourChannelProvider dataProvider;

  YourChannelRepository({required this.dataProvider});

  @override
  Future<List<Channel>> getMyChannels() async {
    return dataProvider.getMyChannels("UserID");
  }
}
