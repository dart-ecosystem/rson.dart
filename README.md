# Rson
A Dart serialization/deserialization library to convert Dart Objects into JSON and back

# Important Notice
1. One serializable class per file.
2. No duplicated serializable class name.
3. Do NOT pass generic type to Rson.fromJson;

# Usage

1. Setup a serializable class by decorating with @Serializable()
```dart
import "package:rson/rson.dart";

@Serializable()
class Entity {
  int a;
}
```

2. Serialization
```dart
void main() {
  var entity = new Entity();
  entity.a = 1;
  print(Rson.toJson(entity)); // output: {"a":1}
}
```

3. Deserialization
```dart
void main() {
  var entity = Rson.fromJson<Entity>({"a": 1});
  print(entity.a); // output: 1
}
```
