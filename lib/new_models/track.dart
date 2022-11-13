import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:happycamper/ratelimiter.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
part 'track.g.dart';

@collection
class Track {
  late final Id id;
  late final String artist;
  late final String title;
  late final int trackNumber;
  late bool liked;

  Track(this.id, this.artist, this.title, this.trackNumber);

  Future<void> setLiked(Isar database, bool liked) async {
    this.liked = liked;
    await saveToDatabase(database);
  }

  Future<void> saveToDatabase(Isar database) async {
    //TODO: Change all saveToDatabase methods to look like this.
    await database.writeTxn(() => database.collection<Track>().put(this));
  }

  static Future<Track?> get(Isar database, RateLimiter rateLimiter, Id id) async {
    //attempt to get the Track from the database.
    Track? databaseResult = await database.collection<Track>().get(id);
    if (databaseResult != null) return databaseResult;

    //If it was not found in the database, grab it from Bandcamp.
    http.Response response = await rateLimiter.doAction(() => http.post(Uri.parse('https://bandcamp.com/EmbeddedPlayer/track=$id/notracklist=false')));
    if (response.statusCode != 200) throw Exception("Track.get($id) invalid HTTP response code: ${response.statusCode}");
    var document = parse(response.body);

    var tagElements = document.getElementsByTagName("script").where((element) => element.attributes.containsKey("data-player-data"));
    if (tagElements.isEmpty) throw Exception("Track.get($id) failed: Response not contain \"data-player-data\" data.");

    var trackData = json.decode(tagElements.first.attributes["data-player-data"].toString().replaceAll("&quot;", '"'));

    if (!trackData.containsKey('tracks')) throw Exception("Track.get($id) failed: Response json does not contain \"track\" field.");
    if (trackData['tracks'].isEmpty) throw Exception("Track.get($id) failed: Response json does not contain any elements in \"track\" list.");

    return (await Track.fromMap(database, trackData['tracks'][0]))?..saveToDatabase(database);
  }

  static Future<Track?> fromMap(Isar database, Map map) async {
    final List<String> requiredParameterNames = ["artist", "title", "id", "tracknum", "duration", "file"];

    Iterable<String> missingParameters = requiredParameterNames.where((element) {
      if (requiredParameterNames.contains(element)) return false;
      return true;
    });

    if (missingParameters.isNotEmpty) throw Exception("Track.fromMap() Missing required paramter(s) $missingParameters");

    if (map['track_streaming'] == false) return null;

    return Track(map['id'], map['artist'], map['title'], map['tracknum']);
  }
}
