import 'package:rson/src/convertor/double_convertor.dart';
import 'package:test/test.dart';

void main() {
  group("Double Convertor Test", () {
    test("double to int", () {
      expect(doubleToInt(1.0), 1);
      expect(doubleToInt(1.0), isA<int>());
      expect(doubleToInt(1.9), 1);
      expect(doubleToInt(1.9), isA<int>());
    });

    test("double to string", () {
      expect(doubleToString(1.0), "1.0");
      expect(doubleToString(1.0), isA<String>());
      expect(doubleToString(2.0), "2.0");
      expect(doubleToString(2.0), isA<String>());
    });

    test("double to num", () {
      expect(doubleToNum(1.0), isA<num>());
      expect(doubleToNum(2.0), isA<num>());
    });

    test("double to object", () {
      expect(doubleToObject(1.0), isA<Object>());
    });
  });
}
