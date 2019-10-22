import 'package:rson/src/object/rson_generic_instantiator.dart';

abstract class RsonGenericInstantiatorRegistry {
  static Map<String, RsonGenericInstantiator> rsonGenericInstantiatorMap = {};

  static void load(Map<String, RsonGenericInstantiator> map) {
    rsonGenericInstantiatorMap = map;
  }

  static RsonGenericInstantiator<T> get<T>(Type type) {
    return getString(type.toString());
  }

  static RsonGenericInstantiator<T> getString<T>(String typeString) {
    return rsonGenericInstantiatorMap[typeString];
  }

  static bool has(Type type) {
    return hasString(type.toString());
  }

  static bool hasString(String typeString) {
    return rsonGenericInstantiatorMap[typeString] != null;
  }
}
