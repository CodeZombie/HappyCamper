import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:happycamper/models/album.dart';

void main() {
  test('Normal album decoding with Album:fromJson', () {
    const rawJson =
        "{\"album_title\":\"Test Album Title\", \"artist\":\"Test Artist\", \"album_art_id\":1216666258, \"linkback\":\"https://www.bandcamp.com/album/test-album-title\", \"tracks\": [{\"title\":\"Test Track Title\", \"tracknum\": 0, \"file\":{\"mp3-128\":\"https://fakecdn.com/fake_track_file.mp3\"}}]}";
    expect(Album.fromJson(json.decode(rawJson)), isInstanceOf<Album>());
  });

  test('Missing base parameter in Album:fromJson', () {
    const rawJson =
        "{\"album_title\":\"Test Album Title\", \"album_art_id\":1216666258, \"linkback\":\"https://www.bandcamp.com/album/test-album-title\", \"tracks\": [{\"title\":\"Test Track Title\", \"tracknum\": 0, \"file\":{\"mp3-128\":\"https://fakecdn.com/fake_track_file.mp3\"}}]}";
    expect(() => Album.fromJson(json.decode(rawJson)), throwsA(const TypeMatcher<FormatException>()));
  });

  test('Empty tracklist in Album:fromJson', () {
    const rawJson = "{\"album_title\":\"Test Album Title\", \"artist\":\"Test Artist\", \"album_art_id\":1216666258, \"linkback\":\"https://www.bandcamp.com/album/test-album-title\", \"tracks\": []}";
    expect(Album.fromJson(json.decode(rawJson)), isInstanceOf<Album>());
  });

  test('Missing tracks key with Album:fromJson', () {
    const rawJson = "{\"album_title\":\"Test Album Title\", \"artist\":\"Test Artist\", \"album_art_id\":1216666258, \"linkback\":\"https://www.bandcamp.com/album/test-album-title\"]}";
    expect(() => Album.fromJson(json.decode(rawJson)), throwsA(const TypeMatcher<FormatException>()));
  });

  test('Empty json object Album:fromJson', () {
    const rawJson = "{}";
    expect(() => Album.fromJson(json.decode(rawJson)), throwsA(const TypeMatcher<FormatException>()));
  });
}
