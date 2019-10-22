import 'package:rson/src/exception/rson_exception.dart';

class RsonUnsupportedTypeException extends RsonException {
  RsonUnsupportedTypeException(Type type) : super("Unsupported type");
}
