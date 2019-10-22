class RsonGenericTypeObject {
  final String name;
  final bool isList;
  const RsonGenericTypeObject(this.name, this.isList);

  Map toJson() {
    return {
      "name": name,
      "isList": isList,
    };
  }
}
