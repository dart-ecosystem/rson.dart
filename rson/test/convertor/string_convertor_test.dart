import 'package:rson/src/convertor/string_convertor.dart';
import 'package:test/test.dart';

void main() {
  group("string Convertor Test", () {
    test("string to double", () {
      expect(stringToDouble("1.0"), 1.0);
      expect(stringToDouble("1.0"), isA<double>());
      expect(stringToDouble("2.0"), 2.0);
      expect(stringToDouble("2.0"), isA<double>());
    });

    test("string to int", () {
      expect(stringToInt("1"), 1);
      expect(stringToInt("1"), isA<int>());
      expect(stringToInt("2"), 2);
      expect(stringToInt("2"), isA<int>());
    });

    test("string to num", () {
      expect(stringToNum("1"), isA<num>());
      expect(stringToNum("2.0"), isA<num>());
    });

    test("string to object", () {
      expect(stringToObject("str"), isA<Object>());
    });
  });
}
