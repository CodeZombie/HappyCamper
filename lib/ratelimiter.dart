class RateLimiter {
  late int waitTimeMilliseconds = 2500;
  DateTime lastActionTime = DateTime.now();
  //TODO: Wait time should have a random influence to better trick BandCamps suspicious traffic detector, if they have one.

  Future<dynamic> doAction(Function f) async {
    while (true) {
      if (DateTime.now().isAfter(lastActionTime.add(Duration(milliseconds: waitTimeMilliseconds)))) {
        break;
      } else {
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
    lastActionTime = DateTime.now();
    return await f();
  }
}
