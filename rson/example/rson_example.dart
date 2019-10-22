import 'package:rson/rson.dart';
import 'package:rson/src/annotation/enable_rson.dart';

@Serializable()
class Entity {
  int a;
  double b;
  num c;
  String d;
  Object e;
  @Ignore()
  List<int> f;
  @SerializedName("g2")
  List<double> g;
}

@EnableRson()
class Entry {}

void main() {
  setup();
//  test();
}

void setup() {}

void test() {
  const Map<String, Object> json = {
    "a": 1,
    "b": 2.0,
    "c": 3.0,
    "d": "4.0",
    "e": 5,
  };
}
