import 'package:demo/entity/nested_entity.dart';
import 'package:demo/main.rson.g.dart';
import 'package:rson/rson.dart';

import 'entity/deep_nested_entity.dart';
import 'entity/entity.dart';

@EnableRson()
class Entry {}

void main() {
  initializeRson();
  Entity entity = Rson.fromJson<Entity>({
    "data": 1,
    "data2": 2.0,
    "data3": 3.0,
    "data4": "str",
    "data5": true,
    "data6": ["1", "2", "3"],
  });
  print(entity.data6);
  NestedEntity nestedEntity = Rson.fromJson<NestedEntity>({
    "entity": {
      "data": 1,
      "data2": 2.0,
      "data3": 3.0,
      "data4": "str",
      "data5": true,
      "data6": ["1", "2", "3"],
    },
  });
  print(nestedEntity.entity.data6);

  DeepNestedEntity deepNestedEntity = Rson.fromJson<DeepNestedEntity>({
    "nestedEntity": {
      "entity": {
        "data": 1,
        "data2": 2.0,
        "data3": 3.0,
        "data4": "str",
        "data5": true,
        "data6": ["1", "2", "3"],
      },
    },
  });
  print(deepNestedEntity.nestedEntity.entity.data6);
}
