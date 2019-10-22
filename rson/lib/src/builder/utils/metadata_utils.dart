import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

class MetadataUtils {
  static bool isType(ElementAnnotation annotation, Type type) {
    return ConstantReader(annotation.computeConstantValue())
        .instanceOf(TypeChecker.fromRuntime(type));
  }
}
