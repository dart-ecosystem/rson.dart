class RsonGenericTypeObject {
  final String name;
  final bool isGeneric;
  const RsonGenericTypeObject(this.name, this.isGeneric);

  Map toJson() {
    return {
      "name": name,
      "isGeneric": isGeneric,
    };
  }
}
