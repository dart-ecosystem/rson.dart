import 'package:demo/entity/nested_generic_entity.dart';
import 'package:rson/rson.dart';

@Serializable()
class ComplicatedGenericEntity<T> {
  List<T> data;
}
