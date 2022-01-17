library happycamper;

import 'dart:math';

import "package:happycamper/models/track.dart";
import 'package:hive/hive.dart';

part 'album.g.dart';

@HiveType(typeId: 0)
class Album {
  @HiveField(0)
  late String artist;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String albumArtId;
  @HiveField(3)
  late String url;
  @HiveField(4)
  late List<Map> tracks;

  Album(this.artist, this.title, this.url, this.albumArtId, this.tracks);

  static Album fromJson(Map<String, dynamic> json) {
    if (!json.containsKey("artist") || !json.containsKey("album_title") || !json.containsKey("linkback") || !json.containsKey("album_art_id") || !json.containsKey("tracks")) {
      throw const FormatException("Album.fromJson(): Missing required fields.");
    }

    return Album(
      json["artist"],
      json["album_title"],
      json["linkback"],
      json["album_art_id"].toString(),
      //json["tracks"].where((track) => track["track_streaming"] == true).map<Track>((track) => Track.fromJson(track)).toList(),
      json["tracks"].where((track) => track["track_streaming"] == true).map<Map>((track) {
        if (!track.containsKey("title") || !track.containsKey("id")) {
          throw const FormatException("Album.fromJson(): Missing required field(s) while parsing a track.");
        }
        return {"title": track["title"], "id": track["id"].toString()};
      }).toList(),
    );
  }

  Track getRandomTrack() {
    int trackIndex = Random().nextInt(tracks.length);
    Map randomTrackInfo = tracks[trackIndex];
    return Track(artist, title, randomTrackInfo["title"], randomTrackInfo["id"], albumArtId, url, trackIndex);
  }

  @override
  String toString() {
    var sb = StringBuffer();
    sb.write("[artist: $artist, title: $title, url: $url, album_art_id: $albumArtId, tracks: [");
    for (var track in tracks) {
      sb.write("$track, ");
    }
    sb.write("] ]");
    return sb.toString();
  }
}
