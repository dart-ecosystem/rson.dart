class RsonGenericTypeObject {
  final String name;
  const RsonGenericTypeObject(this.name);

  Map toJson() {
    return {
      "name": name,
    };
  }
}
