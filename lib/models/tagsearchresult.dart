library happycamper;

import 'package:happycamper/models/tag.dart';
import 'package:hive/hive.dart';

part 'tagsearchresult.g.dart';

@HiveType(typeId: 3)
class TagSearchResult {
  @HiveField(0)
  String searchTerm = "";
  @HiveField(1)
  List<Tag> tags = [];

  TagSearchResult(this.searchTerm, this.tags);

  static TagSearchResult fromJson(String searchTerm, Map<String, dynamic> json) {
    List<Tag> tags = [];
    for (var tag in json['matching_tags']) {
      tags.add(Tag.fromJson(tag));
    }
    return TagSearchResult(searchTerm, tags);
  }

  @override
  String toString() {
    var sb = StringBuffer();
    sb.write("[searchTerm: $searchTerm, tags: [");
    for (var tag in tags) {
      sb.write("$tag, ");
    }
    sb.write("]]");
    return sb.toString();
  }
}
