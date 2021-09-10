import 'package:image_picker/image_picker.dart';
import 'package:podcast_app/models/edit_profile/user_update_dto.dart';

class EditProilfeItems {
  UserUpdate user;
  bool isCreatorChecked;
  XFile? image;
  EditProilfeItems(
      {required this.user,
      required this.image,
      required this.isCreatorChecked});
}
