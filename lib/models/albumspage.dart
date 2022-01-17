library happycamper;

import 'package:hive/hive.dart';

part 'albumspage.g.dart';

@HiveType(typeId: 1)
class AlbumsPage {
  @HiveField(0)
  late bool moreAvailable;
  @HiveField(1)
  late int pageNumber;
  @HiveField(2)
  late List<int> albumIds;

  AlbumsPage(this.moreAvailable, this.pageNumber, this.albumIds);

  static AlbumsPage fromJson(Map<String, dynamic> json, int pageNumber) {
    List<int> albumIds = [];
    if (json.containsKey("items")) {
      for (var albumJson in json["items"]) {
        albumIds.add(albumJson["tralbum_id"]);
      }
    }
    return AlbumsPage(
      json['more_available'],
      pageNumber,
      albumIds,
    );
  }

  @override
  String toString() {
    var sb = StringBuffer();
    sb.write("[moreAvailable: $moreAvailable, page: $pageNumber, tags: [");
    for (var albumId in albumIds) {
      sb.write("$albumId, ");
    }
    sb.write("]]");
    return sb.toString();
  }
}
