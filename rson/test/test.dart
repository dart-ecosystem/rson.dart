import 'package:rson/rson.dart';

void main() {
  print(TypeUtils.getAllDescendantTypes('List<Map<int, Go<double>>>'));
}

bool checkType<T>(Type t) {
  return t == T;
}

Type getType<T>() => T;

Type getTypeFromInstance<T>(T a) {
  return T;
}

Map<T, R> createMap<T, R>([T t, R r]) {
  return Map<T, R>();
}

List<T> createList<T>([T t]) {
  return List<T>();
}
