import 'package:demo/entity/generic_entity.dart';
import 'package:rson/rson.dart';

@Serializable()
class NoneGenericWithGenericFieldEntity {
  GenericEntity<int> genericEntity;
}
