library happycamper;

class Track {
  final String artist;
  final String albumTitle;
  final String title;
  final String id;
  final String albumArtId;
  final String albumUrl;
  final int trackNumber;

  Track(this.artist, this.albumTitle, this.title, this.id, this.albumArtId, this.albumUrl, this.trackNumber);

  @override
  String toString() {
    return 'Track{artist: $artist, albumTitle: $albumTitle, title: $title, id: $id, albumArtId: $albumArtId, albumUrl: $albumUrl, trackNumber: $trackNumber}';
  }
}
