import 'package:rson/src/exception/rson_exception.dart';

class RsonJsonStringDecodeException extends RsonException {
  RsonJsonStringDecodeException(String code)
      : super("Json String Decode Failed: $code");
}
