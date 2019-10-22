import 'dart:convert' as convert;

import 'package:rson/rson.dart';
import 'package:rson/src/exception/rson_json_string_decode_exception.dart';
import 'package:rson/src/exception/rson_serializer_not_found_exception.dart';
import 'package:rson/src/exception/rson_unsupported_type_exception.dart';
import 'package:rson/src/registry/rson_generic_instantiator_registry.dart';
import 'package:rson/src/registry/rson_serializer_registry.dart';
import 'package:rson/src/util/type_utils.dart';

abstract class Rson {
  static Object createInstance(Type type) {
    if (TypeUtils.isTypePrimitive(type)) {
      return null;
    }

    return RsonGenericInstantiatorRegistry.get(type)();
  }

  static void initializeInstance(dynamic instance) {
    if (instance.rsonInitialize != null) {
      instance.rsonInitialize();
    }
  }

  static Object fromJson<T>(Object json, [Object instance]) =>
      fromJson0(json, T, instance);

  static Object fromJson0(Object json, Type type, [Object instance]) {
    // check T type
    if (TypeUtils.isTypeGeneric(type) && TypeUtils.isTypeList(type)) {
      Type subtype = TypeUtils.getSubtype(type);
      return _fromList0(json, subtype);
    }

    if (type != String && type != Object && json is String) {
      return _fromString(json);
    } else if (TypeUtils.isPrimitive(json)) {
      return json;
    } else if (json is Map) {
      return _fromMap0(json, type, instance);
    } else if (json is List) {
      return _fromList0(json, type, instance);
    } else {
      throw RsonUnsupportedTypeException(json.runtimeType);
    }
  }

  static T _fromList<T>(List json) => _fromList0(json, T);

  static Object _fromList0(List json, Type type, [Object instance]) {
//    Object instance;

    if (instance == null) {
      if (TypeUtils.isTypeList(instance.runtimeType) ||
          TypeUtils.isTypeList(type)) {
        // create generic instance if needed
        instance = RsonGenericInstantiatorRegistry.get(type)();
      } else {
        instance = RsonGenericInstantiatorRegistry.getString("List<$type>")();
      }
    }

    for (var jsonItem in json) {
      (instance as List).add(fromJson0(jsonItem, type));
    }

    return instance;
  }

  static T _fromMap<T>(Map json) => _fromMap0(json, T);

  static Object _fromMap0(Map json, Type type, [Object instance]) {
    // create generic instance if needed
    if (instance == null && RsonGenericInstantiatorRegistry.has(type)) {
      instance = RsonGenericInstantiatorRegistry.get(type)();
    }

    // find serializer for the type
    var rso = RsonSerializerRegistry.get(instance.runtimeType) ??
        RsonSerializerRegistry.get(type);

    // make sure rso does exist
    if (rso == null) {
      throw RsonSerializerNotFoundException(type.toString());
    }

    // deserialize json
    return rso.deserializer(instance.runtimeType, json, instance);
  }

  static T _fromString<T>(String json) {
    Object decodedJson;

    try {
      decodedJson = convert.json.decode(json);
    } catch (e) {
      throw RsonJsonStringDecodeException(json);
    }

    return fromJson<T>(decodedJson);
  }

  static String toJson(Object src) {
    return convert.json.encode(toObject(src));
  }

  static Object toObject(Object src) {
    if (TypeUtils.isPrimitive(src)) {
      return src;
    }

    if (src is List) {
      return _toList(src);
    }

    return _toMap(src);
  }

  static List<Object> _toList(List src) {
    return src.map(toObject).toList();
  }

  static Map<String, Object> _toMap(Object src) {
    var rso = RsonSerializerRegistry.get(src.runtimeType);
    if (rso == null) {
      throw RsonSerializerNotFoundException(src.runtimeType.toString());
    }
    return rso.serializer(src);
  }
}
