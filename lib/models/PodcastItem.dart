class PodcastItem {
  final String cover;
  final String title;
  final String subtitle;
  final String auth;
  final String audioUrl;

  PodcastItem(
      {this.title,
      this.subtitle,
      this.cover,
      this.auth,
      this.audioUrl =
          "http://audio.xmcdn.com/group45/M00/AA/F3/wKgKjltAD3uTDp1sAJpgRL8jesI494.m4a"});
}
