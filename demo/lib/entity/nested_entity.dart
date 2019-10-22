import 'package:demo/entity/entity.dart';
import 'package:rson/rson.dart';

@Serializable()
class NestedEntity {
  Entity entity;
}
