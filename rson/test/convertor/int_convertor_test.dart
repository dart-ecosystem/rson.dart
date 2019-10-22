import 'package:rson/src/convertor/int_convertor.dart';
import 'package:test/test.dart';

void main() {
  group("int Convertor Test", () {
    test("int to double", () {
      expect(intToDouble(1), 1);
      expect(intToDouble(1), isA<double>());
      expect(intToDouble(2), 2);
      expect(intToDouble(2), isA<double>());
    });

    test("int to string", () {
      expect(intToString(1), "1");
      expect(intToString(1), isA<String>());
      expect(intToString(2), "2");
      expect(intToString(2), isA<String>());
    });

    test("int to num", () {
      expect(intToNum(1), isA<num>());
      expect(intToNum(2), isA<num>());
    });

    test("int to object", () {
      expect(intToObject(1), isA<Object>());
    });
  });
}
