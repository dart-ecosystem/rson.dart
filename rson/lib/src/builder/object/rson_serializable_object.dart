import 'package:rson/src/builder/object/rson_generic_type_object.dart';

class RsonSerializableFile {
  final String path;
  final String className;
  final bool isGeneric;
  final String genericString;
  final List<RsonGenericTypeObject> genericTypeList;
  final RsonSerializableClass data;
  RsonSerializableFile({
    this.path,
    this.className,
    this.isGeneric,
    this.genericString,
    this.genericTypeList,
    this.data,
  });

  Map toJson() {
    return {
      "path": path,
      "className": className,
      "isGeneric": isGeneric,
      "genericString": genericString,
      "genericTypeList": genericTypeList,
      "data": data,
    };
  }
}

class RsonSerializableClass {
  List<RsonSerializableField> getters = [];
  List<RsonSerializableField> setters = [];

  Map toJson() {
    return {
      "getters": getters,
      "setters": setters,
    };
  }

  static RsonSerializableClass fromJson(Map json) {
    RsonSerializableClass instance = RsonSerializableClass();
    instance.getters = json['getters'].map(RsonSerializableField.fromJson);
    instance.setters = json['setters'].map(RsonSerializableField.fromJson);
    return instance;
  }
}

class RsonSerializableField {
  String type;
  String name;
  String serializedName;
  bool containsGeneric;
  bool containsNoneListGeneric;
  bool containsRawGeneric;

  RsonSerializableField({
    this.type,
    this.name,
    this.serializedName,
    this.containsGeneric = false,
    this.containsNoneListGeneric = false,
    this.containsRawGeneric = false,
  });

  Map toJson() {
    return {
      "type": type,
      "name": name,
      "serializedName": serializedName,
      "containsGeneric": containsGeneric,
      "containsNoneListGeneric": containsNoneListGeneric,
      "containsRawGeneric": containsRawGeneric,
    };
  }

  static RsonSerializableField fromJson(Map json) {
    RsonSerializableField instance = RsonSerializableField();
    instance.type = json['type'];
    instance.name = json['name'];
    instance.serializedName = json['serializedName'];
    instance.containsGeneric = json['containsGeneric'];
    instance.containsNoneListGeneric = json['containsNoneListGeneric'];
    instance.containsRawGeneric = json['containsRawGeneric'];
    return instance;
  }
}
