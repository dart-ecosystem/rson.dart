class TypeRegistry {
  static Map<String, List<Type>> _typeDict = {};

  static void _initTypeName(String name, Type type) {
    if (_typeDict[name] == null) {
      _typeDict[name] = [];
    }
  }

  static void registerType(String name, Type type) {
    _initTypeName(name, type);
    List<Type> typeList = _typeDict[name];
    if (typeList.contains(type)) {
      return;
    }
    typeList.add(type);
  }

  static void loadTypeDict(Map<String, List<Type>> typeDict) {
    _typeDict = typeDict;
  }

  static Type getType(String typeName, {List<String> preferredLibrary}) {
    List<Type> typeList = _typeDict[typeName];
    if (typeList.isEmpty) {
      return null;
    }

    if (typeList.length == 1) {
      return typeList.first;
    }

    // todo: use preferredLibrary to find the type we want;
    return null;
  }
}
