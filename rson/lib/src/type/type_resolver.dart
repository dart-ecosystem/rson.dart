import 'package:rson/src/type/type_parameter.dart';

abstract class TypeResolver {
  TypeParameter resolve(Type type);
}
