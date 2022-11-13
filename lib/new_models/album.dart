import 'dart:math';

import "package:happycamper/new_models/track.dart";
import 'package:happycamper/ratelimiter.dart';
import 'package:isar/isar.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'dart:convert';
part 'album.g.dart';

@collection
class Album {
  final Id id; //tralbum_id
  final String artist;
  final String title;
  final String albumArtId;
  final String url;
  final List<int> trackIds;
  late bool liked;

  Album(this.id, this.artist, this.title, this.albumArtId, this.url, this.trackIds) {
    liked = false;
  }

  Future<Track?> getRandomTrack(Isar database, RateLimiter rateLimiter) async {
    return await Track.get(database, rateLimiter, trackIds[Random().nextInt(trackIds.length)]);
  }

  Future<void> saveToDatabase(Isar database) async {
    await database.writeTxn(() => database.collection<Album>().put(this));
  }

  static Future<Album> get(Isar database, RateLimiter rateLimiter, int id) async {
    Album? databaseResult = await database.collection<Album>().get(id);
    if (databaseResult != null) {
      return databaseResult;
    }

    http.Response response = await rateLimiter.doAction(() => http.post(Uri.parse('https://bandcamp.com/EmbeddedPlayer/album=$id/notracklist=false')));
    if (response.statusCode != 200) {
      throw Exception("Album.get($id) invalid HTTP response code: ${response.statusCode}");
    }

    var document = parse(response.body);
    var tagElements = document.getElementsByTagName("script").where((element) => element.attributes.containsKey("data-player-data"));

    if (tagElements.isEmpty) {
      throw Exception("Album.get($id) did not contain album data.");
    }

    var albumData = json.decode(tagElements.first.attributes["data-player-data"].toString().replaceAll("&quot;", '"'));

    if (!albumData.containsKey("artist") || !albumData.containsKey("album_title") || !albumData.containsKey("linkback") || !albumData.containsKey("album_art_id") || !albumData.containsKey("tracks")) {
      throw const FormatException("Album.fromJson(): Missing required fields.");
    }

    //Get the Track Information for all tracks that have track_streaming enabled.
    List<int> trackIds = albumData["tracks"].where((track) => track["track_streaming"] == true).map<Map>((track) {
      if (!track.containsKey("title") || !track.containsKey("id")) {
        throw const FormatException("Album.fromJson(): Missing required field(s) while parsing a track.");
      }
      return {"title": track["title"], "id": track["id"].toString()};
    }).toList();

    //each song in the album should be inserted into the database here :)
    for (int trackId in trackIds) {
      Track.get(database, rateLimiter, trackId);
    }

    Album album = Album(id, albumData['artist'], albumData["album_title"], albumData["album_art_id"].toString(), albumData["linkback"], trackIds);

    album.saveToDatabase(database);

    return album;
  }
}
