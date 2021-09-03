class Channel {
  final String Id;
  final String Name;
  final String ImageUrl;
  final String Description;
  final int Subscribers;
  final List<Podcast>? Podcasts;

  Channel(
      {required this.Name,
      required this.ImageUrl,
      required this.Subscribers,
      required this.Id,
      required this.Description,
      this.Podcasts});
}

class Podcast {
  final String Name;
  final int? NumberOfLitsners;

  Podcast(this.Name, this.NumberOfLitsners);
}
