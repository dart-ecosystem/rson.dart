import 'package:rson/rson.dart';

@Serializable()
class C<T> {
  List<T> data;

  void rsonInitialize() {
    this.data = <T>[];
  }
}
