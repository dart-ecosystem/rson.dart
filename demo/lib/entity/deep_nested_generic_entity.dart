import 'package:rson/rson.dart';

import 'nested_generic_entity.dart';

@Serializable()
class DeepNestedGenericEntity<T> {
  NestedGenericEntity<T> nestedGenericEntity;
}
