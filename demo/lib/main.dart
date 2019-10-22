import 'package:demo/entity.dart';
import 'package:demo/generic_entity.dart';
import 'package:demo/main.rson.g.dart';
import 'package:rson/rson.dart';

import 'a.dart';
import 'b.dart';
import 'c.dart';

@EnableRson()
class Entry {}

void main() {
  initializeRson();
//  Entity res = Rson.fromJson<Entity>({
//    "a": 1,
//    "b": 1.1,
//    "c": 1.9,
//    "d": "str",
//    "e": "obj",
//    "g2": <dynamic>[1.2],
//    "h": {
//      "a": 2,
//    },
//    "i": [
//      {
//        "a": 3,
//      },
//      {
//        "a": 4,
//      },
//    ],
//    "j": {
//      "a": 5,
//    },
//  });
//  print(res?.i?.first?.a);
//  print(Rson.toJson(res));

  A<C<double>> entity = Rson.fromJson<A<C<double>>>({
    "value": 1,
    "data": {
      "data": {
        "data": [1.0, 2.0],
      },
    },
  });

  print("=====");
  print(entity);
  print(entity.value);
  print(entity.data.data.data);
  print("=====");
//  print(entity?);
}
