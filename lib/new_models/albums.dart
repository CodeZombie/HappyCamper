library happycamper;

import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:happycamper/new_models/album.dart';
import 'package:happycamper/ratelimiter.dart';
import 'package:isar/isar.dart';
import 'package:happycamper/utilities.dart';
import 'package:http/http.dart' as http;

part 'albums.g.dart';

class NoAlbumsException implements Exception {
  String cause;
  NoAlbumsException(this.cause);
}

@collection
class Albums {
  static int newPageProbability = 25;

  Id get id => Albums._getId(tagNames);
  late List<String> tagNames;
  late bool moreAvailable;
  late int pageNumber;
  late List<int> visitedPageNumbers;
  late List<int> albumIds;

  Albums(this.tagNames) {
    moreAvailable = true;
  }

  static int _getId(List<String> tagNames) {
    return fastHash(tagNames.join());
  }

  Future<void> saveToDatabase(Isar database) async {
    await database.writeTxn(() => database.collection<Albums>().put(this));
  }

  Future<Album?> getRandomAlbum(Isar database, RateLimiter rateLimiter) async {
    if (albumIds.isEmpty && moreAvailable == false) throw NoAlbumsException("The tags \"${tagNames.join()}\" match no albums.");

    //roll a weighted die to see if we're going to grab a random album from the object, or if we're grabbing a new page of albums from bandcamp.
    Random randomNumberGenerator = Random();
    bool getNewPage = (randomNumberGenerator.nextInt(100) <= Albums.newPageProbability) ? true : false;

    //If there are no more pages available, don't bother trying to get any more.
    if (moreAvailable == false) {
      getNewPage = false;
    }

    //If we havent visited any pages yet, we have to get a new page.
    if (visitedPageNumbers.isEmpty) {
      getNewPage = true;
    }

    if (getNewPage) {
      //grab a new page from bandcamp and store the values in this object, updating the db.
      int nextPageToVisit = (visitedPageNumbers.isEmpty) ? 1 : visitedPageNumbers[-1] + 1;
      //First, find out which page we need to grab.
      var jsonBody = json.encode({
        'filters': {'format': 'all', 'location': 0, 'sort': 'date', 'tags': tagNames},
        'page': nextPageToVisit
      });

      //Send the request to Bandcamp.
      http.Response response = await rateLimiter.doAction(() => http.post(Uri.parse('https://bandcamp.com/api/hub/2/dig_deeper'), body: jsonBody));

      if (response.statusCode != 200) {
        throw Exception("AlbumSearchResults.get(${tagNames.join()}) invalid HTTP response code: ${response.statusCode}");
      }

      // If the http request was succesful, parse it as json.
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      if (!decodedResponse.containsKey("ok") || decodedResponse["ok"] == false) {
        throw Exception("AlbumSearchResults.get(${tagNames.join()}) invalid response data: ${response.body}");
      }

      //Extract the tralbum_ids from the json.
      List<int> newAlbumIds = [];
      if (decodedResponse.containsKey("items")) {
        for (var albumJson in decodedResponse["items"]) {
          newAlbumIds.add(albumJson["tralbum_id"]);
        }
      }

      for (int albumId in newAlbumIds) {
        if (!albumIds.contains(albumId)) {
          albumIds.add(albumId);
        }
      }

      moreAvailable = decodedResponse['more_available'];

      visitedPageNumbers.add(nextPageToVisit);

      saveToDatabase(database);
    }

    if (albumIds.isEmpty) throw NoAlbumsException("The tags \"${tagNames.join()}\" match no albums.");
    return Album.get(database, rateLimiter, albumIds[randomNumberGenerator.nextInt(albumIds.length)]);
  }

  static Future<Albums?> get(Isar database, List<String> tagNames) async {
    //First, attempt to get the AlbumSearchResults from the database.
    Albums? databaseResult = await database.collection<Albums>().get(Albums._getId(tagNames));
    if (databaseResult != null) {
      return databaseResult;
    }

    //Create a new AlbumSearchResults object, store it in the db and return it.
    return Albums(tagNames)..saveToDatabase(database);
  }
}
