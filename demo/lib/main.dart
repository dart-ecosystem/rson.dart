import 'package:demo/entity/generic_entity.dart';
import 'package:demo/entity/nested_entity.dart';
import 'package:demo/main.rson.g.dart';
import 'package:rson/rson.dart';

import 'entity/complicated_generic_entity.dart';
import 'entity/deep_nested_entity.dart';
import 'entity/deep_nested_generic_entity.dart';
import 'entity/entity.dart';
import 'entity/nested_generic_entity.dart';
import 'entity/none_generic_with_generic_field_entity.dart';

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

  GenericEntity<double> genericEntity = Rson.fromJson<GenericEntity<double>>({
    "data": 1.23,
  });
  print(genericEntity.data);

  NestedGenericEntity<double> nestedGenericEntity =
      Rson.fromJson<NestedGenericEntity<double>>({
    "genericEntity": {
      "data": 1.23,
    },
  });
  print(nestedGenericEntity.genericEntity.data);

  ComplicatedGenericEntity<int> complicatedGenericEntity =
      Rson.fromJson<ComplicatedGenericEntity<int>>({
    "data": [1, 2, 3],
  });
  print(complicatedGenericEntity.data);

  NoneGenericWithGenericFieldEntity noneGenericWithGenericFieldEntity =
      Rson.fromJson<NoneGenericWithGenericFieldEntity>({
    "genericEntity": {
      "data": 1,
    },
  });
  print(noneGenericWithGenericFieldEntity.genericEntity.data);
}
