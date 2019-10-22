// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RsonWriter
// **************************************************************************

import "package:rson/rson.dart";
import "package:demo/entity/nested_entity.dart";
import "package:demo/entity/generic_entity.dart";
import "package:demo/entity/entity.dart";
import "package:demo/entity/deep_nested_entity.dart";

void initializeRson() {
  RsonSerializerRegistry.load({
    // NestedEntity
    NestedEntity: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['entity'] = Rson.toObject((entity as NestedEntity).entity);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(NestedEntity);
        // false
        entity.entity = _fj0(json['entity'], _t<Entity>(), entity.entity);
        return entity;
      },
    ),
    // GenericEntity
    GenericEntity: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['data'] = Rson.toObject((entity as GenericEntity).data);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(GenericEntity);
        Rson.initializeInstance(entity);
        // true
        return entity;
      },
    ),
    // Entity
    Entity: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['data'] = Rson.toObject((entity as Entity).data);
        json['data2'] = Rson.toObject((entity as Entity).data2);
        json['data3'] = Rson.toObject((entity as Entity).data3);
        json['data4'] = Rson.toObject((entity as Entity).data4);
        json['data5'] = Rson.toObject((entity as Entity).data5);
        json['data6'] = Rson.toObject((entity as Entity).data6);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(Entity);
        // false
        entity.data = _fj0(json['data'], _t<int>(), entity.data);
        // false
        entity.data2 = _fj0(json['data2'], _t<num>(), entity.data2);
        // false
        entity.data3 = _fj0(json['data3'], _t<double>(), entity.data3);
        // false
        entity.data4 = _fj0(json['data4'], _t<String>(), entity.data4);
        // false
        entity.data5 = _fj0(json['data5'], _t<bool>(), entity.data5);
        // false
        entity.data6 = _fj0(json['data6'], _t<List<String>>(), entity.data6);
        return entity;
      },
    ),
    // DeepNestedEntity
    DeepNestedEntity: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['nestedEntity'] =
            Rson.toObject((entity as DeepNestedEntity).nestedEntity);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(DeepNestedEntity);
        // false
        entity.nestedEntity =
            _fj0(json['nestedEntity'], _t<NestedEntity>(), entity.nestedEntity);
        return entity;
      },
    ),
  });

  RsonGenericInstantiatorRegistry.load({
    // All Class
    // NestedEntity
    _ts<NestedEntity>(): () => NestedEntity(),
    // GenericEntity
    _ts<GenericEntity>(): () => _Rson_GenericEntity(),
    // Entity
    _ts<Entity>(): () => Entity(),
    // DeepNestedEntity
    _ts<DeepNestedEntity>(): () => DeepNestedEntity(),

    // All Field Types
    _ts<List<String>>(): () => List<String>(),

    // All Generic Usage
  });

  RsonStringTypeRegistry.load({
    "int": int,
    "num": num,
    "double": double,
    "bool": bool,
    "String": String,
    "NestedEntity": NestedEntity,
    "GenericEntity": GenericEntity,
    "Entity": Entity,
    "DeepNestedEntity": DeepNestedEntity,
    "_Rson_GenericEntity": GenericEntity,
  });
}

String _ts<T>() => T.toString();
Type _t<T>() => T;
var _fj0 = Rson.fromJson0;

class _Rson_GenericEntity<T> extends GenericEntity<T> {
  rsonInitialize() {
    this.data = Rson.createInstance(T);
  }
}
