import 'dart:convert';

import 'package:happycamper/ratelimiter.dart';
import 'package:isar/isar.dart';
import 'package:happycamper/utilities.dart';
import 'package:happycamper/new_models/tag.dart';
import 'package:http/http.dart' as http;

part 'tagsearchresults.g.dart';

@collection
class TagSearchResults {
  Id get id => fastHash(searchTerm);
  late String searchTerm;
  late List<int> tagIds;

  TagSearchResults(this.searchTerm, this.tagIds);

  Future<List<Tag?>> getTags(Isar database) async {
    return await database.collection<Tag>().getAll(tagIds);
  }

  Future<void> saveToDatabase(Isar database) async {
    await database.writeTxn(() => database.collection<TagSearchResults>().put(this));
  }

  static Future<TagSearchResults?> get(Isar database, RateLimiter rateLimiter, String searchTerm) async {
    TagSearchResults? databaseResult = await database.collection<TagSearchResults>().get(fastHash(searchTerm));
    if (databaseResult != null) {
      return databaseResult;
    }
    http.Response response = await rateLimiter.doAction(() => http.post(Uri.parse('https://bandcamp.com/api/fansignup/1/search_tag'), body: json.encode({'search_term': searchTerm})));

    if (response.statusCode != 200) {
      throw Exception("BandcampAPI.getTags($searchTerm) invalid HTTP response code: ${response.statusCode}");
    }

    Map<String, dynamic> decodedResponse = json.decode(response.body);
    if (!decodedResponse.containsKey("ok") || decodedResponse["ok"] == false) {
      throw Exception("BandcampAPI.getTags($searchTerm) invalid response data: ${response.body}");
    }

    List<int> tagIds = [];
    for (var tag in decodedResponse['matching_tags']) {
      Tag? newTag = Tag.fromMap(tag)?..saveToDatabase(database);
      if (newTag != null) tagIds.add(newTag.id);
    }

    return TagSearchResults(searchTerm, tagIds);
  }
}
