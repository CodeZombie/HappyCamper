library happycamper;

/// The functions in this file andle all requests to the Bandcamp website/API.

//Todo:
//  Implement RetryClient in each http request.
import 'dart:convert';
import 'package:happycamper/models/tagsearchresult.dart';
import 'package:happycamper/models/albumspage.dart';
import 'package:happycamper/models/tag.dart';
import 'package:happycamper/models/album.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

/// Returns a list of [Tag]s that match the [searchTerm].
///
/// Throws a [Exception] if there is a network error, or the server returns unexpected data.
/// Throws a [FormatException] if the data returned by the server is not in the expected format.
Future<TagSearchResult> getTags(String searchTerm) async {
  http.Response response = await http.post(Uri.parse('https://bandcamp.com/api/fansignup/1/search_tag'), body: json.encode({'search_term': searchTerm}));

  if (response.statusCode != 200) {
    throw Exception("BandcampAPI.getTags($searchTerm) invalid HTTP response code: ${response.statusCode}");
  }

  Map<String, dynamic> decodedResponse = json.decode(response.body);
  if (!decodedResponse.containsKey("ok") || decodedResponse["ok"] == false) {
    throw Exception("BandcampAPI.getTags($searchTerm) invalid response data: ${response.body}");
  }

  TagSearchResult tagSearch = TagSearchResult.fromJson(searchTerm, decodedResponse);
  return tagSearch;
}

/// Returns a list of [Tag]s that are similar or related to the [searchTerm].
///
/// Throws a [Exception] if there is a network error, or the server returns unexpected data.
/// Throws a [FormatException] if the data returned by the server is not in the expected format.
Future<TagSearchResult> getSimilarTags(String searchTerm) async {
  http.Response response = await http.post(Uri.parse('https://bandcamp.com/tag/$searchTerm'));
  if (response.statusCode != 200) {
    throw Exception("BandcampAPI.getSimilarTags($searchTerm) invalid HTTP response code: ${response.statusCode}");
  }

  var document = parse(response.body);
  var tagElements = document.getElementsByTagName("a").where((element) => element.attributes["data-bind"] == "click: relatedTagStat.bind(null, 'related')");

  List<Tag> tags = [];
  for (var tagElement in tagElements) {
    tags.add(Tag(tagElement.innerHtml, tagElement.innerHtml));
  }

  return TagSearchResult(searchTerm, tags);
}

/// Returns an [Album] object containing the specific information about an album with a given [albumId].
///
/// Throws a [Exception] if there is a network error, or the server returns unexpected data.
/// Throws a [FormatException] if the data returned by the server is not in the expected format.
Future<Album> getAlbumInformation(int albumId) async {
  http.Response response = await http.post(Uri.parse('https://bandcamp.com/EmbeddedPlayer/album=$albumId/notracklist=false'));
  if (response.statusCode != 200) {
    throw Exception("BandcampAPI.getAlbumInformation($albumId) invalid HTTP response code: ${response.statusCode}");
  }

  var document = parse(response.body);
  var tagElements = document.getElementsByTagName("script").where((element) => element.attributes.containsKey("data-player-data"));

  if (tagElements.isEmpty) {
    throw Exception("BandcampAPI.getAlbumInformation($albumId) did not contain album data.");
  }

  var albumData = json.decode(tagElements.first.attributes["data-player-data"].toString().replaceAll("&quot;", '"'));

  return Album.fromJson(albumData);
}

/// Returns an [AlbumSearchResult] object which contains album ids of albums which match the given list of [tags] from a specific [page].
///
/// Throws a [Exception] if there is a network error, or the server returns unexpected data.
/// Throws a [FormatException] if the data returned by the server is not in the expected format.
Future<AlbumsPage> getAlbumsPage(List<String> tags, int page) async {
  var jsonBody = json.encode({
    'filters': {'format': 'all', 'location': 0, 'sort': 'date', 'tags': tags},
    'page': page
  });

  http.Response response = await http.post(Uri.parse('https://bandcamp.com/api/hub/2/dig_deeper'), body: jsonBody);

  if (response.statusCode != 200) {
    throw Exception("BandcampAPI.getAlbums($tags, $page) invalid HTTP response code: ${response.statusCode}");
  }

  Map<String, dynamic> decodedResponse = json.decode(response.body);
  if (!decodedResponse.containsKey("ok") || decodedResponse["ok"] == false) {
    throw Exception("BandcampAPI.getAlbums($tags, $page) invalid response data: ${response.body}");
  }

  AlbumsPage albumSearchresult = AlbumsPage.fromJson(decodedResponse, page);
  return albumSearchresult;
}
