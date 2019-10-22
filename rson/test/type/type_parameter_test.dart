import 'package:rson/src/type/type_parameter.dart';
import 'package:rson/src/type/type_registry.dart';
import 'package:test/test.dart';

void main() {
  group("TypeParameter Test", () {
    setUpAll(() {
      TypeRegistry.registerType("List", List);
      TypeRegistry.registerType("Map", Map);
      TypeRegistry.registerType("int", int);
      TypeRegistry.registerType("double", double);
      TypeRegistry.registerType("String", String);
    });

    test("getDynamicType()", () {
      // one level
      TypeParameter type =
          TypeParameter(getTypeString<Map<Map<int, double>, List<String>>>());
      expect(
        type.getDynamicType(),
        Map,
      );
      expect(
        type.getTypeParameters(),
        hasLength(2),
      );
      expect(
        type.getTypeParameters().first.getDynamicType(),
        Map,
      );
      expect(
        type.getTypeParameters().last.getDynamicType(),
        List,
      );
    });

    test("getType()", () {
      TypeParameter type = TypeParameter(
        getTypeString<Map<Map<int, double>, List<String>>>(),
      );
//      print(initialize(List, 1));
//      var a = initialize(List, 1);
//      print(a);
//      print(getType(a));
//      print(initialize(List, a).runtimeType);
    });
  });
}

String getTypeString<T>() => T.toString();

dynamic initialize<T1, T2, T3, T4, T5, T6>(
  Type type, [
  T1 _1,
  T2 _2,
  T3 _3,
  T4 _4,
  T5 _5,
]) {
  print("-----start");
  print(_1);
  print(_1.runtimeType);
  print(T1);
  print("-----end");
  if (type == int) {
    return 1;
  } else if (type == List) {
    return List<T1>();
  } else if (type == Map) {
    return Map<T1, T2>();
  }
}

Type getType<T>([T t]) => T;

typedef Object Instantiator<T1>(
  Type type, [
  T1 _1,
]);
