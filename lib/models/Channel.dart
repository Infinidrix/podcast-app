import 'Podcast.dart';

class Channel {
  final String Id;
  final String Name;
  final String ImageUrl;
  final int Subscribers;
  final String Desctiption;
  final List<Podcast> Podcasts;

  Channel(
      {required this.Name,
      required this.ImageUrl,
      required this.Subscribers,
      required this.Id,
      required this.Desctiption,
      required this.Podcasts});
}
