

class Podcast {
  final String name;
  final String url;
  final String? imageUrl;
  final String id;
  final int? numberOfListeners;
  final String channelName;
  final String description;

  Podcast(this.name, this.description, this.numberOfListeners, this.url, this.channelName, this.id, {this.imageUrl});
}