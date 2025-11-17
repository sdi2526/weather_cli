import 'package:test/test.dart';

void main() {
  test('some tests with local and utc DateTime', () async {
    var nowLocal = DateTime.now();
    print("nowLocal: $nowLocal");
    var nowInUtc = nowLocal.toUtc();
    print("nowInUtc: $nowInUtc");
    print("nowLocal.isUtc: ${nowLocal.isUtc}");
    print("nowInUtc.isUtc: ${nowInUtc.isUtc}");
    print("nowInUtc.toLocal(): ${nowInUtc.toLocal()}");
    print("nowLocal.toLocal(): ${nowLocal.toLocal()}");

    var parsed = DateTime.parse("2025-11-11 11:11");
    print("parsed: $parsed");
    var parsedUtc = DateTime.parse("2025-11-11 11:11Z");
    print("parsedUtc: $parsedUtc");
    print("parsed.isUtc: ${parsed.isUtc}");
    print("parsedUtc.isUtc: ${parsedUtc.isUtc}");

    var parsedUtcPlusOne = parsedUtc.add(Duration(hours: 1));
    print("parsedUtcPlusOne: $parsedUtcPlusOne");
    print("parsedUtcPlusOne.isUtc: ${parsedUtcPlusOne.isUtc}");

    var parsedUtcPlusOneLocal = parsedUtcPlusOne.toLocal();
    print("parsedUtcPlusOneLocal: $parsedUtcPlusOneLocal");
    print("parsedUtcPlusOneLocal.isUtc: ${parsedUtcPlusOneLocal.isUtc}");

    // var nowPlusOneInUtc = nowInUtc.add(Duration(hours: 1));
    // print("nowPlusOneInUtc: $nowPlusOneInUtc");
    // print("nowPlusOneInUtc.isUtc: ${nowPlusOneInUtc.isUtc}");

    // var nowPlusOneLocal = nowPlusOneInUtc.toLocal();
    // print("nowPlusOneLocal: $nowPlusOneLocal");
    // print("nowPlusOneLocal.isUtc: ${nowPlusOneLocal.isUtc}");
  });
}
