abstract class RsonStringTypeRegistry {
  static Map<String, Type> rsonSerializerMap = {};

  static void load(Map<String, Type> map) {
    rsonSerializerMap = map;
  }

  static bool has(String typeName) {
    return rsonSerializerMap[typeName] != null;
  }

  static Type get(String typeName) {
    return rsonSerializerMap[typeName];
  }
}
