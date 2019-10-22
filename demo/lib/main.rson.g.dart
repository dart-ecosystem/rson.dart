// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RsonWriter
// **************************************************************************

import "package:rson/rson.dart";
import "package:demo/entity2.dart";
import "package:demo/c.dart";
import "package:demo/b.dart";
import "package:demo/a.dart";

void initializeRson() {
  RsonSerializerRegistry.load({
    // Entity2
    Entity2: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['a'] = Rson.toObject((entity as Entity2).a);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(Entity2);
        Rson.initializeInstance(entity);
        entity.a = Rson.fromJson0(json['a'], type, entity.a);
        return entity;
      },
    ),
    // C
    C: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['data'] = Rson.toObject((entity as C).data);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(C);
        Rson.initializeInstance(entity);
        entity.data = Rson.fromJson0(json['data'], type, entity.data);
        return entity;
      },
    ),
    // B
    B: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['data'] = Rson.toObject((entity as B).data);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(B);
        Rson.initializeInstance(entity);
        entity.data = Rson.fromJson0(json['data'], type, entity.data);
        return entity;
      },
    ),
    // A
    A: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['value'] = Rson.toObject((entity as A).value);
        json['data'] = Rson.toObject((entity as A).data);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(A);
        Rson.initializeInstance(entity);
        entity.value = Rson.fromJson0(json['value'], type, entity.value);
        entity.data = Rson.fromJson0(json['data'], type, entity.data);
        return entity;
      },
    ),
  });

  RsonGenericInstantiatorRegistry.load({
    // Entity2
    t2s<Entity2>(): () => Entity2(),
    // C
    t2s<C>(): () => _Rson_C(),
    // B
    t2s<B>(): () => _Rson_B(),
    // A
    t2s<A>(): () => _Rson_A(),
    // All Generic Usage
    t2s<A<C<double>>>(): () => _Rson_A<C<double>>(),
    t2s<C<double>>(): () => _Rson_C<double>(),
  });

  RsonStringTypeRegistry.load({
    "Entity2": Entity2,
    "C": C,
    "B": B,
    "A": A,
    "_Rson_C": C,
    "_Rson_B": B,
    "_Rson_A": A,
  });
}

String t2s<T>() => T.toString();

class _Rson_C<T> extends C<T> {
  rsonInitialize() {
    this.data = List<T>();
  }
}

class _Rson_B<T> extends B<T> {
  rsonInitialize() {
    this.data = Rson.createInstance(T);
  }
}

class _Rson_A<T> extends A<T> {
  rsonInitialize() {
    this.data = _Rson_B<T>();
  }
}
