import 'package:rson/src/type/type_registry.dart';
import 'package:rson/src/util/type_utils.dart';

class TypeParameter {
  String _typeString;

  TypeParameter(this._typeString);

  Type getDynamicType() {
    return TypeRegistry.getType(
      TypeUtils.getFirstLevelTypeString(_typeString),
    );
  }

  Type getType() {
    return null;
  }

  List<TypeParameter> getTypeParameters() {
    return TypeUtils.getSecondLevelTypeStrings(_typeString)
        .map((e) => TypeParameter(e))
        .toList();
  }
}
