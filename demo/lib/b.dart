import 'package:rson/rson.dart';

@Serializable()
class B<T> {
  T data;

  void rsonInitialize() {
    this.data = Rson.createInstance(T);
  }
}

// B.rsonCreate<int>()
