library happycamper;

import 'dart:io';

import 'package:happycamper/models/album.dart';
import 'package:happycamper/models/albumspage.dart';
import 'package:happycamper/models/tagsearchresult.dart';
import 'package:happycamper/models/tag.dart';
import 'package:hive/hive.dart';

/// Will manage the Hive DB stuff as well as the get() middleware.
/// Will not contain any of the data retreival logic, that will go in HappyCamper.

/// A combination of AlbumsPages can be derived by hitting getCacheOnly() with the given tags until null is returned.
/// The last albumpage prior to the null will be checked to see if it has more_available set to true.
/// If it does, we can call get() with the next value and it'll get and store the next value. ez.
///
///
class Cache {
  late LazyBox _cache;
  late String boxName;

  Cache(this.boxName) {
    Hive.init(Directory.current.path);
    Hive.registerAdapter(AlbumAdapter());
    Hive.registerAdapter(AlbumsPageAdapter());
    Hive.registerAdapter(TagAdapter());
    Hive.registerAdapter(TagSearchResultAdapter());
  }

  Future openBoxIfNotOpen() async {
    if (!Hive.isBoxOpen(boxName)) {
      _cache = await Hive.openLazyBox(boxName);
    }
  }

  String generateKey(Function f, [List? params]) {
    return f.toString() + (params ?? "").toString();
  }

  /// Attempts to find the cached data, else it calls the function, caches its output and returns it.
  Future<dynamic> get(Function f, [List? params]) async {
    String key = generateKey(f, params);

    await openBoxIfNotOpen();

    dynamic value = await _cache.get(key);

    if (value != null) {
      print("Cache Hit");
      return value;
    }
    print("Cache Miss");
    Future result = Function.apply(f, params);
    result.then((v) => _cache.put(key, v));
    return result;
  }

  /// Returns the value only if it exists in the cache, else it returns null.
  Future<dynamic> getCacheOnly(Function f, [List? params]) async {
    String key = generateKey(f, params);

    await openBoxIfNotOpen();

    return await _cache.get(key);
  }
}
