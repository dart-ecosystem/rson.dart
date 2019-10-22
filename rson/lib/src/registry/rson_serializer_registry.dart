import 'package:rson/rson.dart';
import 'package:rson/src/object/rson_serializer_object.dart';
import 'package:rson/src/registry/rson_string_type_registry.dart';
import 'package:rson/src/util/type_utils.dart';

abstract class RsonSerializerRegistry {
  static Map<Type, RsonSerializerObject> rsonSerializerMap = {};

  static void load(Map<Type, RsonSerializerObject> map) {
    rsonSerializerMap = map;
  }

  static RsonSerializerObject get(Type type) {
    if (type == null) {
      return null;
    }
    if (TypeUtils.isTypeGeneric(type)) {
      return _getGeneric(type);
    }
    return rsonSerializerMap[type];
  }

  static RsonSerializerObject _getGeneric(Type type) {
    String typeName = TypeUtils.getFirstLevelTypeString(type.toString());
    if (!RsonStringTypeRegistry.has(typeName)) {
      return null;
    }
    type = RsonStringTypeRegistry.get(typeName);
    return rsonSerializerMap[type];
  }
}
