import 'package:happycamper/new_models/album.dart';
import 'package:happycamper/new_models/albums.dart';
import 'package:happycamper/new_models/tag.dart';
import 'package:happycamper/new_models/tagsearchresults.dart';
import 'package:happycamper/new_models/track.dart';
import 'package:happycamper/ratelimiter.dart';
import 'package:isar/isar.dart';

class HappyCamper {
  Isar? database;
  RateLimiter? rateLimiter;

  bool isInitialized() {
    if (rateLimiter == null || database == null) return false;
    return true;
  }

  Future<void> initialize() async {
    database = await Isar.open([AlbumSchema, AlbumsSchema, TagSchema, TagSearchResultsSchema, TrackSchema]);
    rateLimiter = RateLimiter();
  }

  Future<List<Tag>> getTags(String searchTerm) async {
    if (!isInitialized()) throw Exception("HappyCamper.getTags() Error: HappyCamper not initialized.");

    TagSearchResults? tagSearchResults = await TagSearchResults.get(database!, rateLimiter!, searchTerm);
    if (tagSearchResults == null) return [];

    List<Tag> tags = [];
    for (int tagId in tagSearchResults.tagIds) {
      Tag? tag = await Tag.get(database!, rateLimiter!, tagId);
      if (tag != null) tags.add(tag);
    }
    return tags;
  }
}
