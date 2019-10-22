import 'package:rson/src/exception/rson_exception.dart';

class RsonSerializerNotFoundException extends RsonException {
  RsonSerializerNotFoundException(String entityName)
      : super("Serializer Not Found: $entityName");
}
