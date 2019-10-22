// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RsonWriter
// **************************************************************************

import "package:rson/rson.dart";
import "package:demo/c.dart";
import "package:demo/b.dart";
import "package:demo/a.dart";

void initializeRson() {
  RsonSerializerRegistry.load({
    // C
    C: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        json['data'] = Rson.toObject((entity as C).data);
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance(C);
        (entity as C).rsonInitialize();
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
        (entity as B).rsonInitialize();
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
        (entity as A).rsonInitialize();
        entity.value = Rson.fromJson0(json['value'], type, entity.value);
        entity.data = Rson.fromJson0(json['data'], type, entity.data);
        return entity;
      },
    ),
  });

  RsonGenericInstantiatorRegistry.load({
    // C
    t2s<C>(): () => C(),
    // B
    t2s<B>(): () => B(),
    // A
    t2s<A>(): () => A(),
    t2s<A<C<double>>>(): () => A<C<double>>(),
    t2s<C<double>>(): () => C<double>(),
  });

  RsonStringTypeRegistry.load({
    "C": C,
    "B": B,
    "A": A,
  });
}

String t2s<T>() => T.toString();
