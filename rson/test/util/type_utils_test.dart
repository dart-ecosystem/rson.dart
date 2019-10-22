import 'package:rson/src/util/type_utils.dart';
import 'package:test/test.dart';

void main() {
  group("TypeUtils Test", () {
    test("getFirstLevelTypeString()", () {
      expect(
        TypeUtils.getFirstLevelTypeString("List"),
        "List",
      );
      expect(
        TypeUtils.getFirstLevelTypeString("Map<int, String>"),
        "Map",
      );
      expect(
        TypeUtils.getFirstLevelTypeString("List<int>"),
        "List",
      );
      expect(
        TypeUtils.getFirstLevelTypeString("Map<List<int>, Map<String, num>>"),
        "Map",
      );
      expect(
        TypeUtils.getFirstLevelTypeString(
          "A<List<int>, Map<String, num>, C<D>>",
        ),
        "A",
      );
    });

    test("getSecondLevelTypeStrings()", () {
      expect(
        TypeUtils.getSecondLevelTypeStrings("Map<int, String>"),
        equals(["int", "String"]),
      );
      expect(
        TypeUtils.getSecondLevelTypeStrings("List<int>"),
        equals(["int"]),
      );
      expect(
        TypeUtils.getSecondLevelTypeStrings("Map<List<int>, Map<String, num>>"),
        equals(["List<int>", "Map<String,num>"]),
      );
      expect(
        TypeUtils.getSecondLevelTypeStrings(
          "A<List<int>, Map<String, num>, C<D>>",
        ),
        equals(["List<int>", "Map<String,num>", "C<D>"]),
      );
    });
  });
}
