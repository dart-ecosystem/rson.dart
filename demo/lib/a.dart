import 'package:demo/main.rson.g.dart';
import 'package:rson/rson.dart';

import 'b.dart';
import 'c.dart';

@Serializable()
class A<T extends Object> {
  int value;
  B<T> data;

  void rsonInitialize() {
    this.data = B<T>();
  }
}
