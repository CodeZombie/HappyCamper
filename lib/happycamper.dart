library happycamper;

import 'dart:math';

import 'package:happycamper/cache.dart';
import 'package:happycamper/models/tagsearchresult.dart';
import 'package:happycamper/models/track.dart';
import 'package:happycamper/models/albumspage.dart';
import 'package:happycamper/models/album.dart';
import 'package:happycamper/bandcampapi.dart' as bandcamp_api;

class HappyCamper {
  Cache cache = Cache("happycamper");

  Future<Track> getRandomTrack(List<String> tags) async {
    AlbumsPage page = await cache.get(bandcamp_api.getAlbumsPage, [tags, 1]);
    int albumId = page.albumIds[Random().nextInt(page.albumIds.length)];
    Album album = await cache.get(bandcamp_api.getAlbumInformation, [albumId]);
    return album.getRandomTrack();
  }

  Future<TagSearchResult> getSimilarTags(String searchTerm) async {
    return await cache.get(bandcamp_api.getSimilarTags, [searchTerm]);
  }
}
