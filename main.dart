import 'package:happycamper/happycamper.dart';

//This file is purely for development purposes. It should eventually be deleted in exchange for a comprehensive test suite.
main() {
  /*bandcamp_api.getAlbumsPage(["dubstep"], 5).then((tagsearch) {
    print(tagsearch.toString());
  }).onError((error, stackTrace) {
    print(error);
    print("Stacktrace: ");
    print(stackTrace);
  });*/
  /*
  bandcamp_api.getAlbumInformation(3783706183).then((value) {
    print(value.toString());
  }).onError((error, stackTrace) {
    print(error);
    print("Stacktrace: ");
    print(stackTrace);
  });*/
  var hc = HappyCamper();
  /*hc.getRandomTrack([""]).then((value) {
    print(value.toString());
  }).onError((error, stackTrace) {
    print(error);
    print("Stacktrace: ");
    print(stackTrace);
  });*/

  hc.getSimilarTags("funk").then((value) {
    print(value.toString());
  }).onError((error, stackTrace) {
    print(error);
    print("Stacktrace: ");
    print(stackTrace);
  });
}
