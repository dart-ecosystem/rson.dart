import 'package:demo/entity/nested_entity.dart';
import 'package:rson/rson.dart';

@Serializable()
class DeepNestedEntity {
  NestedEntity nestedEntity;
}
