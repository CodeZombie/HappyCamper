import 'package:happycamper/new_models/albums.dart';
import 'package:happycamper/new_models/tagsearchresults.dart';
import 'package:happycamper/new_models/album.dart';
import 'package:happycamper/ratelimiter.dart';
import 'package:isar/isar.dart';
import 'package:happycamper/utilities.dart';

part 'tag.g.dart';

//NOTES:
// Because a hash has the possibility of collision, we shouldn't count in it being unique, despite how astronomically low the probability of a collision is.
// For this reason, when retrieving objects with hash-based IDs, we should then also actually compare the returned values names.

@collection
class Tag {
  Id get id => fastHash(name);
  late final String name; // used for display purposes
  late final String normalizedName; // used for API calls TODO: We might never need to use this!
  late bool liked = false;

  Tag(this.name, this.normalizedName);

  Future<void> saveToDatabase(Isar database) async {
    await database.writeTxn(() => database.collection<Tag>().put(this));
  }

  static Future<Tag?> get(Isar database, tagName, int tagId) async {
    Tag? databaseResult = await database.collection<Tag>().get(fastHash(tagName));
    return databaseResult;
  }

  Future<TagSearchResults?> getSimilarTags(Isar database, RateLimiter rateLimiter) async {
    return TagSearchResults.get(database, rateLimiter, name);
  }

  Future<Album?> getRandomAlbum(Isar database, RateLimiter rateLimiter) async {
    Albums? albums = await Albums.get(database, [name]);
    return await albums?.getRandomAlbum(database, rateLimiter);
  }

  static Tag? fromMap(Map map) {
    final List<String> requiredParameterNames = ["tag_name", "tag_norm_name"];
    Iterable<String> missingParameters = requiredParameterNames.where((element) {
      if (requiredParameterNames.contains(element)) return false;
      return true;
    });
    if (missingParameters.isNotEmpty) throw Exception("Track.fromMap() Missing required paramter(s) $missingParameters");

    return Tag(map["tag_name"], map["tag_norm_name"]);
  }
}
