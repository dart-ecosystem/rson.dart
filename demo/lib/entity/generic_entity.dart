import 'package:rson/rson.dart';

@Serializable()
class GenericEntity<T> {
  T data;
}
