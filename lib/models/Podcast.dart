

class Podcast {
  final String Name;
  final String url;
  final String? imageUrl;
  final String id;
  final int? NumberOfLitsners;

  Podcast(this.Name, this.NumberOfLitsners, this.url, this.id, {this.imageUrl});
}