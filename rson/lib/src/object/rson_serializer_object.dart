class RsonSerializerObject {
  final RsonSerializer serializer;
  final RsonDeserializer deserializer;
  const RsonSerializerObject(this.serializer, this.deserializer);
}

typedef Map<String, Object> RsonSerializer(Object entity);

typedef Object RsonDeserializer(Type type, Map<String, Object> json,
    [dynamic entity]);
