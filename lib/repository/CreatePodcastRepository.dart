import 'dart:io';

class CreatePodcastRepository {
  Future<void> savePodcast(
      File? file, String podcastTitle, String podcastDescription) async {
    print(file?.path.toString());
    print(podcastTitle);
    print(podcastDescription);
    await Future.delayed(Duration(seconds: 3));
  }
}
