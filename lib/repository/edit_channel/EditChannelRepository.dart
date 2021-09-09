import 'package:podcast_app/data_provider/edit_channel/IEditChannelProvider.dart';
import 'package:podcast_app/repository/edit_channel/IEditChannelRepositoy.dart';

class EditChannelRepository extends IEditChannelRepository {
  IEditChannelProvider apidataProvider;
  EditChannelRepository({
    required this.apidataProvider,
  });
}
