class Podcast {
  final String Name;
  final String url;
  final String? imageUrl;
  final String id;
  final int? NumberOfLitsners;

  Podcast(
      {required this.Name,
      required this.NumberOfLitsners,
      required this.url,
      required this.id,
      this.imageUrl});
}
