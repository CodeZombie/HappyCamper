library happycamper;

import 'package:hive/hive.dart';

part 'tag.g.dart';

@HiveType(typeId: 2)
class Tag {
  @HiveField(0)
  late String name; // used for display purposes
  @HiveField(1)
  late String normalizedName; // used for API calls
  Tag(this.name, this.normalizedName);

  static Tag fromJson(Map<String, dynamic> json) {
    return Tag(json['tag_name'], json['tag_norm_name']);
  }

  @override
  String toString() {
    return "[Name: $name, NormalizedName: $normalizedName]";
  }
}
