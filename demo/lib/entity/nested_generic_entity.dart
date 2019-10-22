import 'package:demo/entity/generic_entity.dart';
import 'package:rson/rson.dart';

@Serializable()
class NestedGenericEntity<T> {
  GenericEntity<T> genericEntity;
}
