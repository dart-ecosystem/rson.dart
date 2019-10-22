// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RsonWriter
// **************************************************************************

import "package:rson/rson.dart";
import "package:demo/entity/none_generic_with_generic_field_entity.dart";
import "package:demo/entity/complicated_generic_entity.dart";
import "package:demo/entity/nested_entity.dart";
import "package:demo/entity/nested_generic_entity.dart";
import "package:demo/entity/generic_entity.dart";
import "package:demo/entity/entity.dart";
import "package:demo/entity/deep_nested_generic_entity.dart";
import "package:demo/entity/deep_nested_entity.dart";

void initializeRson() {
  RsonSerializerRegistry.load({
    // NoneGenericWithGenericFieldEntity
    NoneGenericWithGenericFieldEntity: RsonSerializerObject(
      (Object e) {
        Map<String, Object> j = {};
        j['genericEntity'] =
            _to((e as NoneGenericWithGenericFieldEntity).genericEntity);
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci(NoneGenericWithGenericFieldEntity);
        e.genericEntity =
            _fj0(j['genericEntity'], _t<GenericEntity<int>>(), e.genericEntity);
        return e;
      },
    ),
    // ComplicatedGenericEntity
    ComplicatedGenericEntity: RsonSerializerObject(
      (Object e) {
        Map<String, Object> j = {};
        j['data'] = _to((e as ComplicatedGenericEntity).data);
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci(ComplicatedGenericEntity);
        _ii(e);
        e.data = _fj0(j['data'], null, e.data);
        return e;
      },
    ),
    // NestedEntity
    NestedEntity: RsonSerializerObject(
      (Object e) {
        Map<String, Object> j = {};
        j['entity'] = _to((e as NestedEntity).entity);
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci(NestedEntity);
        e.entity = _fj0(j['entity'], _t<Entity>(), e.entity);
        return e;
      },
    ),
    // NestedGenericEntity
    NestedGenericEntity: RsonSerializerObject(
      (Object e) {
        Map<String, Object> j = {};
        j['genericEntity'] = _to((e as NestedGenericEntity).genericEntity);
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci(NestedGenericEntity);
        _ii(e);
        e.genericEntity = _fj0(j['genericEntity'], null, e.genericEntity);
        return e;
      },
    ),
    // GenericEntity
    GenericEntity: RsonSerializerObject(
      (Object e) {
        Map<String, Object> j = {};
        j['data'] = _to((e as GenericEntity).data);
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci(GenericEntity);
        _ii(e);
        e.data = _fj0(j['data'], null, e.data);
        return e;
      },
    ),
    // Entity
    Entity: RsonSerializerObject(
      (Object e) {
        Map<String, Object> j = {};
        j['data'] = _to((e as Entity).data);
        j['data2'] = _to((e as Entity).data2);
        j['data3'] = _to((e as Entity).data3);
        j['data4'] = _to((e as Entity).data4);
        j['data5'] = _to((e as Entity).data5);
        j['data6'] = _to((e as Entity).data6);
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci(Entity);
        e.data = _fj0(j['data'], _t<int>(), e.data);
        e.data2 = _fj0(j['data2'], _t<num>(), e.data2);
        e.data3 = _fj0(j['data3'], _t<double>(), e.data3);
        e.data4 = _fj0(j['data4'], _t<String>(), e.data4);
        e.data5 = _fj0(j['data5'], _t<bool>(), e.data5);
        e.data6 = _fj0(j['data6'], _t<List<String>>(), e.data6);
        return e;
      },
    ),
    // DeepNestedGenericEntity
    DeepNestedGenericEntity: RsonSerializerObject(
      (Object e) {
        Map<String, Object> j = {};
        j['nestedGenericEntity'] =
            _to((e as DeepNestedGenericEntity).nestedGenericEntity);
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci(DeepNestedGenericEntity);
        _ii(e);
        e.nestedGenericEntity =
            _fj0(j['nestedGenericEntity'], null, e.nestedGenericEntity);
        return e;
      },
    ),
    // DeepNestedEntity
    DeepNestedEntity: RsonSerializerObject(
      (Object e) {
        Map<String, Object> j = {};
        j['nestedEntity'] = _to((e as DeepNestedEntity).nestedEntity);
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci(DeepNestedEntity);
        e.nestedEntity =
            _fj0(j['nestedEntity'], _t<NestedEntity>(), e.nestedEntity);
        return e;
      },
    ),
  });

  RsonGenericInstantiatorRegistry.load({
    // All Class
    // NoneGenericWithGenericFieldEntity
    _ts<NoneGenericWithGenericFieldEntity>(): () =>
        NoneGenericWithGenericFieldEntity(),
    // ComplicatedGenericEntity
    _ts<ComplicatedGenericEntity>(): () => _Rson_ComplicatedGenericEntity(),
    // NestedEntity
    _ts<NestedEntity>(): () => NestedEntity(),
    // NestedGenericEntity
    _ts<NestedGenericEntity>(): () => _Rson_NestedGenericEntity(),
    // GenericEntity
    _ts<GenericEntity>(): () => _Rson_GenericEntity(),
    // Entity
    _ts<Entity>(): () => Entity(),
    // DeepNestedGenericEntity
    _ts<DeepNestedGenericEntity>(): () => _Rson_DeepNestedGenericEntity(),
    // DeepNestedEntity
    _ts<DeepNestedEntity>(): () => DeepNestedEntity(),

    // All Field Types
    _ts<GenericEntity<int>>(): () => _Rson_GenericEntity<int>(),
    _ts<List<String>>(): () => List<String>(),

    // All Generic Usage
    _ts<GenericEntity<double>>(): () => _Rson_GenericEntity<double>(),
    _ts<NestedGenericEntity<double>>(): () =>
        _Rson_NestedGenericEntity<double>(),
    _ts<ComplicatedGenericEntity<int>>(): () =>
        _Rson_ComplicatedGenericEntity<int>(),
  });

  RsonStringTypeRegistry.load({
    "int": int,
    "num": num,
    "double": double,
    "bool": bool,
    "String": String,
    "NoneGenericWithGenericFieldEntity": NoneGenericWithGenericFieldEntity,
    "ComplicatedGenericEntity": ComplicatedGenericEntity,
    "NestedEntity": NestedEntity,
    "NestedGenericEntity": NestedGenericEntity,
    "GenericEntity": GenericEntity,
    "Entity": Entity,
    "DeepNestedGenericEntity": DeepNestedGenericEntity,
    "DeepNestedEntity": DeepNestedEntity,
    "_Rson_ComplicatedGenericEntity": ComplicatedGenericEntity,
    "_Rson_NestedGenericEntity": NestedGenericEntity,
    "_Rson_GenericEntity": GenericEntity,
    "_Rson_DeepNestedGenericEntity": DeepNestedGenericEntity,
  });
}

String _ts<T>() => T.toString();
Type _t<T>() => T;
var _fj0 = Rson.fromJson0;
var _ii = Rson.initializeInstance;
var _ci = Rson.createInstance;
var _to = Rson.toObject;

class _Rson_ComplicatedGenericEntity<T> extends ComplicatedGenericEntity<T> {
  rsonInitialize() {
    this.data = List<T>();
  }
}

class _Rson_NestedGenericEntity<T> extends NestedGenericEntity<T> {
  rsonInitialize() {
    this.genericEntity = _Rson_GenericEntity<T>();
  }
}

class _Rson_GenericEntity<T> extends GenericEntity<T> {
  rsonInitialize() {
    this.data = Rson.createInstance(T);
  }
}

class _Rson_DeepNestedGenericEntity<T> extends DeepNestedGenericEntity<T> {
  rsonInitialize() {
    this.nestedGenericEntity = _Rson_NestedGenericEntity<T>();
  }
}
